
Package body Gestion_Personnel is

procedure saisie_pers(P : out t_pers) is
    Car : Character;
    begin
    Saisie_identite (P.identite);
    loop
    Put("Role du personnel : Ingenieur (1) ou Technicien (2) ?"); new_line;
    get(car); 
    case car is
    when '1' => P.ingenieur := true; exit;
    when '2' => P.ingenieur := false; exit;
    when others => put("Veuillez reessayer la saisie."); new_line;
    end case;
    end loop;
    skip_line;
    P.Nb_J_presta := 0;
    P.dispo := true;
    P.depart := false;
end saisie_pers;

Procedure ajout_pers (Liste : in out t_ptr_pers; P : in T_pers) is
    B1,B2 : boolean;
    begin
    if liste = null then
        liste := new t_cell_pers'(p,null);
    else
        Meme_NP (Liste.val.identite.Nom,P.identite.nom,B1);
        Meme_NP (Liste.val.identite.Prenom, P.identite.Prenom,B2);
        if B1 = true and then B2 = true then
            If Liste.val.ingenieur = P.ingenieur then
                Put("Un membre du personnel existe deja avec ces identifiants et le même role."); new_line;
            else
                ajout_pers (Liste.suiv, P );
            end if;
        end if;
    end if;
end ajout_pers;

procedure ajout_pers_liste (liste : in out t_ptr_pers) is
    P : T_pers;
begin
    saisie_pers (p);
    ajout_pers (Liste, P);
end ajout_pers_liste;

procedure affi_pers (P : in t_pers) is
begin
    affi_identite (P.identite);
    Put("Jours de prestation a son actif : "); put(P.Nb_J_presta,3); new_line;
    If P.ingenieur = true then
        put("Role : ingenieur"); new_line;
    else
        put("Role : Technicien"); new_line;
    end if;
    If P.dispo = true then
        put("Ce membre du personnel est actuellement disponible"); new_line;
    else
        put("Ce membre du personnel est actuellement indisponible"); new_line;
    end if;
    if P.depart = true then
        PUT("Ce membre du personnel a une demande de dpart d'active"); new_line;
    else
        put("Ce membre du personnel n'a pas de demande de depart d'active"); new_line;
    end if;
end affi_pers;
    
procedure visu_pers (Liste : in t_ptr_pers) is
    begin
    if liste /= null then
    put("-----------------------------------"); new_line;
    affi_pers (Liste.val);
    visu_pers (Liste.suiv);
    else
    put("-----------------------------------"); new_line;
    end if;
end visu_pers;

procedure del_pers (Liste : in out t_ptr_pers; P : in out T_pers) is
    b1,B2 : boolean;
begin
    if liste /= null then
        Meme_NP (Liste.Val.identite.Nom, P.identite.Nom, B1);
        Meme_NP (Liste.Val.identite.Prenom,P.identite.Prenom, B2);
        if B1 = true and then B2 = true then
            if Liste.val.ingenieur = P.ingenieur and then P.dispo = true then
                liste := liste.suiv;
                Put("Personnel supprime de la liste avec succes"); new_line;
            elsif Liste.val.ingenieur = P.ingenieur and then P.dispo = false then
                P.depart := true;
                put("La demande de suppression a ete enregistree et sera effectuee quand l'employe reviendra de mission"); new_line;
            else
                del_pers (Liste.suiv, P);
            end if;
        else
            del_pers (Liste.suiv, P);
        end if;
    else
        put("Aucun personnel correspondant n'a ete trouve dans la liste."); new_line;
    end if;
end del_pers;

procedure supprimer_pers (Liste : in out t_ptr_pers) is
    P : T_pers;
    car : Character;
begin
    if liste = null then
        put("Aucun membre de personnel dans la liste");
    else
        Saisie_identite (P.identite);
        loop
            Put("Role du personnel : Ingenieur (1) ou Technicien (2) ?"); new_line;
            get(car); 
            case car is
                when '1' => P.ingenieur := true; exit;
                when '2' => P.ingenieur := false; exit;
                when others => put("Veuillez reessayer la saisie."); new_line;
            end case;
        end loop;
        skip_line;
        del_pers (Liste, P);
    end if;
end supprimer_pers;

procedure visu_mb_pers (Liste : in t_ptr_pers; P : in T_pers) is
    B1,B2 : boolean;
    begin
    if liste = null then
        put("Aucun membre du personnel ne correspond au criteres recherches"); new_line;
    else
        Meme_NP (Liste.val.identite.Nom, P.identite.Nom, B1);
        Meme_NP (Liste.val.identite.Prenom, P.identite.Prenom, B2);
        if B1 = true and then B2 = true then
            if Liste.Val.ingenieur = P.ingenieur then
                affi_pers (Liste.val);
            else
                visu_mb_pers (Liste.suiv, P);
            end if;
        else
            visu_mb_pers (Liste.suiv, P);
        end if;
    end if;
end visu_mb_pers;

procedure Visu_membre_pers (liste : in t_ptr_pers) is
    p : T_pers;
    car : Character;
    begin
    if liste = null then
        put("La liste des membres du personnel est vide"); new_line;
    else
        Saisie_identite (P.identite);
        loop
            Put("Role du personnel : Ingenieur (1) ou Technicien (2) ?"); new_line;
            get(car); 
            case car is
                when '1' => P.ingenieur := true; exit;
                when '2' => P.ingenieur := false; exit;
                when others => put("Veuillez reessayer la saisie."); new_line;
            end case;
        end loop;
        skip_line;
        visu_mb_pers(liste,P);
    end if;
end Visu_membre_pers;

end Gestion_Personnel;