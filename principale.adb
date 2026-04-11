with ada.text_io, ada.integer_text_io,gestion_date,gestion_materiel,gestion_demandes,gestion_client,gestion_identite,gestion_location;
use  ada.text_io, ada.integer_text_io,gestion_date,gestion_materiel,gestion_demandes,gestion_client,gestion_identite,gestion_location;

procedure principale is
   Tete: T_Ptr_Materiel:=NULL;
   F:T_File_Demande;
   D:T_Demande;
   Ok:Boolean;
   N:Integer;
   A: T_Ptr_Client;
   L:t_ptr_location;
BEGIN

   Charger_Donnees_Initiales(Tete);
   visupack(tete);







end principale;
