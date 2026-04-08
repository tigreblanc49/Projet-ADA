Package body Gestion_Client is

procedure Saisie_Client(C : out T_client) is
begin
Saisie_identite(C.client);
C.Nb_loc := 0;
C.Facture := 0;
C.Montant_regle := 0;
end Saisie_Client;

Function client_existe(root : T_ptr_Client; NC : T_client) return boolean is
   b1,B2 : boolean;
   begin
   if root = null then
      return false;
   else
      Meme_NP (Root.Val.client.nom,NC.client.nom, b1);
      Meme_NP (root.val.client.Prenom,NC.client.Prenom, B2);
      if B1 = true and then B2 = true then
         return True;
      else
         if client_existe (root.sg, Nc) = true or else client_existe (Root.sd, NC) = true then
            return true;
         else
            return false;
         end if;
      end if;
   end if;
end client_existe;

procedure Ajout_client(Root : in out T_ptr_Client; NC : in T_client) is
Rootsupp : Boolean;
   procedure Aux (Root : in out T_ptr_Client; NC : in T_client) is
   begin
      if Root = null then
      Root := new T_cell_client'(NC, null, null);
      Put("Le client a ete ajoute avec succes"); new_line;
      else
         comp_identite (Root.val.client,NC.client, Rootsupp);
         if Rootsupp = false then
            Ajout_client (Root.sd, NC);
         else
            Ajout_client (Root.sg, NC);
         end if;
      end if;
   end Aux;
begin
   if client_existe (root, NC) = true then
      put("Ce client existe deja");
   else
      Aux(root, NC);
   end if;
end Ajout_client;

procedure affi_client (C: in T_client) is
   begin
      affi_identite (C.client);
      put("Nombre de location effectuees : "); put(C.Nb_loc,2); new_line;
      put("Facture restant a regler : "); put(C.Facture,4); New_line;
      put("Montant deja regle par ce client aurparavant : "); put(C.Montant_regle,5); new_line;
end affi_client;


procedure Affi_arbre (root : in t_ptr_client) is
begin
   if root /= null then
      affi_client (Root.val);
      Affi_arbre (Root.sg);
      Affi_arbre (Root.sd);
   end if;
end Affi_arbre;


end Gestion_Client;