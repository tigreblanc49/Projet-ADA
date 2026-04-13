with ada.text_io, ada.integer_text_io;
USE  Ada.Text_Io, Ada.Integer_Text_Io;

PACKAGE BODY Gestion_Identite IS


procedure Saisie_NP (NP : out T_nomPnom) is
   begin
   Get_Line(NP.mot,NP.k);
end Saisie_NP;

procedure Saisie_identite (I : out T_identite) is
   buffer : T_nomPnom;
   begin
      Put("Veuillez saisir le Nom :"); new_line;
      Saisie_NP(Buffer);
      I.Nom := buffer;
      Put("Veuillez saisir le Prenom :"); new_line;
      Saisie_NP (Buffer);
      I.Prenom := Buffer;
end Saisie_identite;

procedure Affi_NP (NP : in T_nomPnom) is
   begin
   For i in 1..NP.K loop
      Put(NP.Mot(i));
   end loop;
end Affi_NP;

procedure affi_identite (I : in T_identite) is
   begin
   put("Nom : "); Affi_NP (I.Nom); New_line;
   put("Prenom : "); Affi_NP (I.Prenom); New_Line;
end affi_identite;

procedure Meme_NP (I1,I2 : in T_nomPnom; Meme : out boolean) is
   begin
   meme := true;
   if I1.K /= I2.K then
   Meme := false;
   else
   for i in 1..I1.K loop
      if I1.Mot(i) /= I2.Mot(i) then
         Meme := false;
      end if;
   end loop;
   end if;
   END Meme_Np;


--PROCEDURE comp_identite (I1, I2 : IN T_Identite; I1Superieur : OUT Boolean) IS
--BEGIN
--   -- 1. On compare d'abord les Noms
--   -- On extrait la partie utile du mot grâce à l'indice K
--   IF I1.Nom.Mot(1..I1.Nom.K) > I2.Nom.Mot(1..I2.Nom.K) THEN
--      I1Superieur := True;
--   ELSIF I1.Nom.Mot(1..I1.Nom.K) < I2.Nom.Mot(1..I2.Nom.K) THEN
--      I1Superieur := False;
--   ELSE
--      -- 2. Si les Noms sont identiques, on compare les Prénoms
--      IF I1.Prenom.Mot(1..I1.Prenom.K) > I2.Prenom.Mot(1..I2.Prenom.K) THEN
--         I1Superieur := True;
--      ELSE
--         -- Si Prénoms identiques ou I2 supérieur, on renvoie False
--         I1Superieur := False;
--      END IF;
--   END IF;
--END comp_identite;

procedure comp_identite (I1,I2 : in T_identite; I1superieur : out Boolean) is
   n : integer;
   buffer : boolean;
   begin
      I1superieur := true;
      Meme_NP (I1.Nom,I2.Nom, buffer);
      if buffer = false then
         if I1.Nom.K > I2.Nom.K then
            n := I2.nom.K;
         else
            n := I1.Nom.K;
         end if;
         for i in 1..n loop
            If I2.Nom.Mot(i) > I1.Nom.Mot(i) and then I1superieur = true then
            I1superieur := false;
            exit;
            end if;
         end loop;
      else
         Meme_NP (I1.Prenom,I2.Prenom, buffer);
         if buffer = true then
            I1superieur := False;
         else
            if I1.Prenom.K > I2.Prenom.K then
            n := I2.Prenom.K;
            else
            n := I1.Prenom.K;
            end if;
            for i in 1..n loop
               If I2.Prenom.Mot(i) > I1.Prenom.Mot(i) and then I1superieur = true then
               I1superieur := false;
               exit;
               end if;
            end loop;
         end if;
      end if;
end comp_identite;



--procedure comp_identite (I1, I2 : in T_identite; I1superieur : out Boolean) is
--   n : integer;
--   buffer : boolean;
--begin
--   Meme_NP (I1.Nom, I2.Nom, buffer);
--
--   if buffer = false then
--      -- On prend la taille du mot le plus court pour ne pas déborder
--      if I1.Nom.K > I2.Nom.K then n := I2.nom.K; else n := I1.Nom.K; end if;

--      for i in 1..n loop
--         if I1.Nom.Mot(i) > I2.Nom.Mot(i) then
--            I1superieur := true;
--            return; -- On a trouvé, on quitte la procédure
--         elsif I2.Nom.Mot(i) > I1.Nom.Mot(i) then
--            I1superieur := false;
--            return; -- On a trouvé, on quitte la procédure
--         end if;
--      end loop;
--
--      -- Si on arrive ici, c'est que les n premières lettres sont pareilles
--      -- Le plus long est alors le "plus grand"
--      I1superieur := (I1.Nom.K > I2.Nom.K);

--   else
--      -- Les noms sont identiques, on compare les prénoms
--      Meme_NP (I1.Prenom, I2.Prenom, buffer);
--      if buffer = true then
--         I1superieur := false; -- Strictement identiques
--      else
--         if I1.Prenom.K > I2.Prenom.K then n := I2.Prenom.K; else n := I1.Prenom.K; end if;

--         for i in 1..n loop
--            if I1.Prenom.Mot(i) > I2.Prenom.Mot(i) then
--               I1superieur := true;
--               return;
--            elsif I2.Prenom.Mot(i) > I1.Prenom.Mot(i) then
--               I1superieur := false;
--               return;
--            end if;
--         end loop;
--         I1superieur := (I1.Prenom.K > I2.Prenom.K);
--      end if;
--   end if;
--end comp_identite;



End Gestion_identite;