With Gestion_identite, ada.Text_IO, ada.Integer_Text_IO;
use Gestion_identite,ada.Text_IO,ada.Integer_Text_IO;

Package Gestion_Client is

Type T_client is record
   client : T_identite;
   Nb_loc : integer;
   Facture : integer;
   Montant_regle : Natural;
end record;

Type T_cell_client;
Type T_ptr_Client is access T_cell_client;
Type T_cell_client is record
   Val: T_client;
   sg,sd : T_ptr_client;
end record;

procedure Saisie_Client(C : out T_client);
Function client_existe(root : T_ptr_Client; NC : T_client) return boolean;
procedure Ajout_client(Root : in out T_ptr_Client; NC : in T_client);
procedure affi_client(C : in T_client);
PROCEDURE Affi_Arbre (Root : IN T_Ptr_Client);
procedure chargerabre(arbre: in out T_ptr_client);
procedure Mettre_A_Jour_Client(Root : in out T_ptr_Client;
                               ID_Cherche : in T_identite;
   Montant : IN Integer);
procedure reglement(A: in out T_ptr_client;montant_paye: in integer; identite: in T_identite);
end Gestion_Client;