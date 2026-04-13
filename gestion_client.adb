With Gestion_identite, ada.Text_IO, ada.Integer_Text_IO;
use Gestion_identite,ada.Text_IO,ada.Integer_Text_IO;
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
--      Put("Le client a ete ajoute avec succes"); new_line;
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

procedure Mettre_A_Jour_Client(Root : in out T_ptr_Client;
                               ID_Cherche : in T_identite;
                               Montant : in integer) is
   Trouve_Nom, Trouve_Prenom : Boolean;
   Go_Gauche : Boolean;
begin
   if Root /= null then
      Meme_NP(Root.Val.client.nom, ID_Cherche.nom, Trouve_Nom);
      Meme_NP(Root.Val.client.prenom, ID_Cherche.prenom, Trouve_Prenom);
      if Trouve_Nom and Trouve_Prenom then
         Root.Val.Nb_Loc := Root.Val.Nb_Loc + 1;
         Root.Val.Facture := Root.Val.Facture + Integer(Montant);
      ELSE
            comp_identite(Root.Val.client, ID_Cherche, Go_Gauche);
            if Go_Gauche then
               Mettre_A_Jour_Client(Root.sg, ID_Cherche, Montant);
            else
               Mettre_A_Jour_Client(Root.sd, ID_Cherche, Montant);
            end if;

      end if;
   end if;
END Mettre_A_Jour_Client;

PROCEDURE Chargerabre(Arbre: IN OUT T_Ptr_Client) IS
   ID : T_identite;
   C1 : T_client;
BEGIN

ID.Nom.K := 5;
ID.Nom.Mot(1..5) :="Aline";
ID.Prenom.K := 6;
ID.Prenom.Mot(1..6) :="Mouton";
C1.client := id;
C1.Facture := 0;
C1.Montant_regle := 0;
C1.Nb_loc :=0;
Ajout_client (arbre, C1);
ID.Nom.K := 5;
ID.Nom.Mot(1..5) :="Belle";
ID.Prenom.K := 5;
ID.Prenom.Mot(1..5) :="Lucie";
C1.client := id;
C1.Facture := 0;
C1.Montant_regle := 0;
C1.Nb_loc :=0;
Ajout_client (arbre, C1);
ID.Nom.K := 8;
ID.Nom.Mot(1..8) :="Personne";
ID.Prenom.K := 4;
ID.Prenom.Mot(1..4) :="Paul";
C1.client := id;
C1.Facture := 0;
C1.Montant_regle := 0;
C1.Nb_loc :=0;
Ajout_client (arbre, C1);
ID.Nom.K := 3;
ID.Nom.Mot(1..3) :="Arc";
ID.Prenom.K := 4;
ID.Prenom.Mot(1..4) :="Jean";
C1.client := id;
C1.Facture := 0;
C1.Montant_regle := 0;
C1.Nb_loc :=0;
Ajout_client (arbre, C1);
ID.Nom.K := 6;
ID.Nom.Mot(1..6) :="Dubois";
ID.Prenom.K := 7;
ID.Prenom.Mot(1..7) :="Josette";
C1.client := id;
C1.Facture := 0;
C1.Montant_regle := 0;
C1.Nb_loc :=0;
Ajout_client (arbre, C1);
ID.Nom.K := 5;
ID.Nom.Mot(1..5) :="Romeo";
ID.Prenom.K := 8;
ID.Prenom.Mot(1..8) :="Juliette";
C1.client := id;
C1.Facture := 0;
C1.Montant_regle := 0;
C1.Nb_loc :=0;
Ajout_client (arbre, C1);
ID.Nom.K := 6;
ID.Nom.Mot(1..6) :="Bartok";
ID.Prenom.K := 5;
ID.Prenom.Mot(1..5) :="Belle";
C1.client := id;
C1.Facture := 0;
C1.Montant_regle := 0;
C1.Nb_loc :=0;
Ajout_client (arbre, C1);
ID.Nom.K := 5;
ID.Nom.Mot(1..5) :="Cadet";
ID.Prenom.K := 9;
ID.Prenom.Mot(1..9) :="Benjamine";
C1.client := id;
C1.Facture := 0;
C1.Montant_regle := 0;
C1.Nb_loc :=0;
Ajout_client (arbre, C1);
ID.Nom.K := 5;
ID.Nom.Mot(1..5) :="Rebel";
ID.Prenom.K := 6;
ID.Prenom.Mot(1..6) :="Alicia";
C1.client := id;
C1.Facture := 0;
C1.Montant_regle := 0;
C1.Nb_loc :=0;
Ajout_client (arbre, C1);
ID.Nom.K := 8;
ID.Nom.Mot(1..8) :="Tigresse";
ID.Prenom.K := 4;
ID.Prenom.Mot(1..4) :="Lily";
C1.client := id;
C1.Facture := 0;
C1.Montant_regle := 0;
C1.Nb_loc :=0;
Ajout_client (arbre, C1);

end chargerabre;
PROCEDURE Reglement(A: IN OUT T_Ptr_Client;Montant_Paye: IN Integer; Identite: IN T_Identite) IS
nom,prenom: boolean; gauche:boolean;
BEGIN
   IF A=NULL THEN
      Put("arbre vide"); New_Line;
   ELSE
      Meme_NP(A.Val.client.nom, identite.nom, nom);
      Meme_NP(A.Val.Client.Prenom, Identite.Prenom, Prenom);
      IF Nom AND Prenom THEN
         IF Montant_Paye > A.Val.Facture THEN
            Put("erreur le montant paye ne peut pas etre superieur a la facture");New_Line;
         ELSE
            A.Val.Facture := A.Val.Facture - Montant_Paye;
            A.Val.Montant_regle := A.Val.Montant_regle + Montant_Paye;
            Put_Line("Reglement enregistre avec succes.");
         END IF;
      ELSE
         Comp_Identite(A.Val.Client, identite, Gauche);
         IF Gauche THEN
            Reglement(A.Sg,Montant_Paye,identite);
         ELSE
            Reglement(A.Sd, Montant_Paye, identite);
         END IF;
      END IF;
   END IF;

END Reglement ;






end Gestion_Client;
