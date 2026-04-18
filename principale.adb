with ada.text_io, ada.integer_text_io,gestion_date,gestion_materiel,gestion_demandes,gestion_client,gestion_identite,gestion_location,gestion_personnel;
use  ada.text_io, ada.integer_text_io,gestion_date,gestion_materiel,gestion_demandes,gestion_client,gestion_identite,gestion_location,gestion_personnel;

procedure principale is
--   Tete: T_Ptr_Materiel:=NULL;
--   F:T_File_Demande;
--   D:T_Demande;
--   Ok:Boolean;
--   N:Integer;
--   A: T_Ptr_Client;
--   Lc:T_Ptr_Location;
--   La:T_Ptr_Location:=null;
--   P:T_Ptr_Pers;
--   Pe:T_Pers;
--   De:T_Date;
--   Choixfo: Character;
    Arbre_C  : T_Ptr_Client := null;
    Liste_M  : T_Ptr_Materiel := null;
    Liste_P  : T_Ptr_Pers := null;
    File_D   : T_File_Demande;
    Loc      : T_Ptr_Location := null;
   Loca     : T_Ptr_Location := NULL;
   Dema:T_Ptr_Demande;
   identiteee:T_identite;

    Date_J   : T_Date;
   Choix_G  : Integer;
   Reponse: integer;
   Date_d:T_date;

    Ident    : T_Identite;
    Client    : T_Client;
    Mat   : T_Materiel;
    Pers  : T_Pers;
    Dem   : T_Demande;
   Val   : Integer;
   Num: integer;
   Cat: T_Type_Materiel;
   Choixp:Integer;
   Numero: Integer;
   identitee:T_identite;


BEGIN
   Saisirdate(Date_J);
   put_line("nous sommes le");
   Visudate(Date_j);new_line;
   Put_Line("BIENVENUE");
   LOOP
      Put_Line ("Que voulez vous gerer ?");
      Put_Line ("1 : Gestion des clients");
      Put_Line ("2 : Gestion du pack de materiels");
      Put_Line ("3 : Gestion des employes");
      Put_Line ("4 : gestion des demandes");
      Put_Line ("5 : gestion location");
      Put_Line ("6 : passer au lendemain");
      Put_Line ("7 : Sauvegarde ,chargement des donnees et resaturation");
      Put_Line ("0 : Quitter");
      Get(Choix_G);Skip_Line;

         case Choix_G is
         WHEN 1 =>
            LOOP
               Put_Line("1 : Visualiser la clientele");
               Put_Line("2 : Enregistrer un reglement");
               Put_Line("0 : Quitter");
                Get(Reponse); Skip_Line;
                CASE Reponse IS
                  WHEN 1 => Affi_Arbre(Arbre_C);
                  WHEN 2 =>
                    Saisie_Identite(Ident);
                    Put_line("Montant du reglement : "); Get(Val); Skip_Line;
                     Reglement(Arbre_C,Val,Ident);
                  WHEN 0 =>
                     EXIT;
                  WHEN OTHERS =>
                     put_line("choix non proposee,recommencez");
               END CASE;
            END LOOP;
         WHEN 2 =>
            LOOP
               Put_Line("1 : Ajouter un pack");
               Put_Line("2 : Visualiser tous les packs");
               Put_Line("3 : Visualiser packs disponibles");
               Put_Line("4 : Supprimer un pack le numero et categorie");
               Put_Line("5 : Supprimer packs avant une  Date donnee");
               Put_Line("0 : Quitter");
               Get(Reponse); Skip_Line;
               CASE Reponse IS

               WHEN 1 =>
               Ajoutpack(Liste_M);
               WHEN 2 =>
               Visupack(Liste_M);
               WHEN 3 =>
               Visupackdispo(Liste_M);
                  WHEN 4 =>


               Put_Line("numero du pack a supprimer");
                     Get(Num);Skip_Line;
                     LOOP

               Put_Line("choisir la categorie a supprimer");
               Put_Line(" 1 - Camera");
               Put_Line(" 2 - Plateforme");
               Put_Line(" 3 - Sono");
               Put_Line(" 4 - Projecteur");
               Put_Line(" 5 - Lumiere");
               Put_Line(" 0 - Quitter");
               Put_Line("Votre choix : ");
               Get(Choixp); Skip_Line;
               CASE Choixp IS
                  WHEN 1 => Cat := Camera;
                  WHEN 2 => Cat := Plateforme;
                  WHEN 3 => Cat := Sono;
                  WHEN 4 => Cat := Projecteur;
                  WHEN 5 => Cat := Lumiere;
                  WHEN 0 => exit;
                  WHEN OTHERS => Put_Line("choix non disponible,recommencez");
                        END CASE;
                        Suppack(Liste_M,Num,Cat);
                     END LOOP;


                  WHEN 5 =>
                     Saisirdate(Date_D);
                     SuppackD(Liste_M,Date_D);
                     WHEN 0 => exit;
                  WHEN OTHERS =>
                      Put_Line("choix non disponible,recommencez");
               END CASE;
            END LOOP;
         WHEN 3 =>
            LOOP
            Put_Line("1 : Ajouter un employe");
            Put_Line("2 : Visualiser tout le personnel");
            Put_Line("3 : Infos sur un employe precis");
               Put_Line("4 : Enregistrer demande de depart");
               Put_Line("0 : Quitter");
               Get(Reponse); Skip_Line;
               CASE Reponse IS
                  WHEN 1 =>
                     Ajout_Pers_Liste(Liste_P);
                  WHEN 2 =>
                     Visu_Pers(Liste_P);
                  WHEN 3 =>
                     Visu_Membre_Pers(Liste_P);
                  WHEN 4 =>
                     Supprimer_Pers(Liste_P);
                      WHEN 0  => EXIT;
                  WHEN others =>
                      Put_Line("choix non disponible,recommencez");

               END CASE;
            END LOOP;
            WHEN 4 =>
            LOOP
               Put_Line("1 : Nouvelle demande de location");
               Put_Line("2 : Supprimer une demande avec identite");
               Put_Line("3 : Visualiser demandes en attente");
               Put_Line("0 : Quitter");
               Get(Reponse); Skip_Line;
               CASE Reponse IS
                  WHEN 1 =>
                     Nouveldemande(File_D,Arbre_C,Dem);
                  WHEN 2 =>
                     put_line("entrez le numero"); get(numero);skip_line;
                     Suppdl(File_D,Numero);
                  WHEN 3 =>
                     VisuF(File_D);
                     WHEN 0 => EXIT;
                  WHEN OTHERS
                        =>Put_Line("choix non disponible,recommencez");

               END CASE;
            END LOOP;
         WHEN 5 =>
            LOOP
               Put_Line("1 : Visualiser locations en cours");
               Put_Line("2 : Visualiser locations archivees");
               Put_Line("3 : Locations par employe");
               Put_Line("4 : Locations par client");
               Put_Line("0 : Quitter");
               Get(Reponse); Skip_Line;
               CASE Reponse IS
                  WHEN 1 =>
                     Visul(Loc);
                  WHEN 2 =>
                     Visul(Loca);
                  WHEN 3 =>
                     saisie_identite(identitee);
                     Visu_par_employe(Loc,Loca,Identitee);
                  WHEN 4 =>
                     saisie_identite(identiteee);
                     Visu_locations_client(Loc,Loca,Identiteee);
                  WHEN 0 => EXIT;

                  WHEN OTHERS =>Put_Line("choix non disponible,recommencez") ;
               END CASE;
            END LOOP;
         WHEN 6 =>
            Lendemaind(Date_J,Loc,Loca,Arbre_C,File_D,Liste_M,Liste_P);
         WHEN 7 =>
            loop
            Put_Line("1 :sauvergade");
            Put_Line("2 :chargement des donnees");
               Put_Line("3 :restauration des donnees");
               Put_Line("0 :Quitter");
            Get(Reponse); Skip_Line;
               CASE Reponse IS
                  WHEN 1 =>
                     NULL;
                  WHEN 2 =>
                        Charger_Donnees_L(Loc);
                        charger_donnees_initiales(Liste_M);
                        Chargerfa(File_D);
                        Chargerabre(Arbre_C);
                     Charger_P(Liste_P);
                   WHEN 3 =>
                     NULL;
                    WHEN 0 => exit ;
                  WHEN OTHERS => Put_Line("choix non disponible,recommencez") ;
               END CASE;
            END LOOP;
            when others => EXIT;
      END CASE;
   END LOOP;

















--   Charger_Donnees_L(Lc);
--   charger_donnees_initiales(tete);
--   Chargerfa(F);
--   Chargerabre(A);
--   Charger_P(P);
--   saisirdate(De);
----   Nouveldemande(F,A,D);
----   VisuF(F);
----   Affi_Arbre(A);
--   Lendemaind(De,Lc,La,A,F,Tete,P);
--   Visudate(De);
--   Put_Line("location archives");
--   Visul(La);
--   Affi_Arbre(A);
--   Put_Line("location en cours");
--   visul(LC);
--Put_Line("--- ETAT DES STOCKS ---");
--Visupack(tete); -- Pour voir si une Camera est libre (Dispo: True)
--   Visu_Pers(P); -- Pour voir si un Ingenieur est libre (Dispo: True)
--      visuF(F);



--   saisie_pers(pe);
--   del_pers(p,pe);
--   visu_pers(P);
--   ajoutpack(tete);
--   Visupackdispo(Tete);












end principale;
