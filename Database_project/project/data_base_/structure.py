#structure pour ajouter les tarifs d'un client dans la base de donnees bo
route="https://bo.amexpert.pro:4443/client/<int:id>/<str:typo>/ajouter/tarifs/"
method='POST'
params={
    id=id client
    typo="ext"
}

json={
    "edl_prix_std": decimal,
    "edl_appt_prix_f1": decimal,
    "edl_appt_prix_f2": decimal,
    "edl_appt_prix_f3": decimal,
    "edl_appt_prix_f4": decimal,
    "edl_appt_prix_f5": decimal,
    "edl_appt_prix_f6": decimal,
    "edl_pav_villa_prix_t1": decimal,
    "edl_pav_villa_prix_t2": decimal,
    "edl_pav_villa_prix_t3": decimal,
    "edl_pav_villa_prix_t4": decimal,
    "edl_pav_villa_prix_t5": decimal,
    "edl_pav_villa_prix_t6": decimal,
    "edl_pav_villa_prix_t7": decimal,
    "edl_pav_villa_prix_t8": decimal,
    "chif_appt_prix_stu": decimal,
    "chif_appt_prix_f1": decimal,
    "chif_appt_prix_f2": decimal,
    "chif_appt_prix_f3": decimal,
    "chif_appt_prix_f4": decimal,
    "chif_appt_prix_f5": decimal,
    "chif_pav_villa_prix_t1": decimal,
    "chif_pav_villa_prix_t2": decimal,
    "chif_pav_villa_prix_t3": decimal,
    "chif_pav_villa_prix_t4": decimal,
    "chif_pav_villa_prix_t5": decimal,
    "chif_pav_villa_prix_t6": decimal,
    "chif_pav_villa_prix_t7": decimal,
    "chif_pav_villa_prix_t8": decimal,
    "code_tva": integer,
    "referent_as_client": id referent,
    "com_as_sur_ca_client": decimal,
    "cell_dev_ref_responsable": decimal,
    "prix_autre": decimal,
    "taux_meuble": decimal,
}

#structure de donnees pour modifier les donnees
route="https://bo.amexpert.pro:4443/edit/<int:id>/<str:typo>/tarif"
method='PUT'
params={
    id=id client
    typo="ext"
}
#merci de faire un get method sur la route voir tarifs d'utilisateur pour recupere les donnees avant de modifie
json={
    "edl_prix_std": decimal,
    "edl_appt_prix_f1": decimal,
    "edl_appt_prix_f2": decimal,
    "edl_appt_prix_f3": decimal,
    "edl_appt_prix_f4": decimal,
    "edl_appt_prix_f5": decimal,
    "edl_appt_prix_f6": decimal,
    "edl_pav_villa_prix_t1": decimal,
    "edl_pav_villa_prix_t2": decimal,
    "edl_pav_villa_prix_t3": decimal,
    "edl_pav_villa_prix_t4": decimal,
    "edl_pav_villa_prix_t5": decimal,
    "edl_pav_villa_prix_t6": decimal,
    "edl_pav_villa_prix_t7": decimal,
    "edl_pav_villa_prix_t8": decimal,
    "chif_appt_prix_stu": decimal,
    "chif_appt_prix_f1": decimal,
    "chif_appt_prix_f2": decimal,
    "chif_appt_prix_f3": decimal,
    "chif_appt_prix_f4": decimal,
    "chif_appt_prix_f5": decimal,
    "chif_pav_villa_prix_t1": decimal,
    "chif_pav_villa_prix_t2": decimal,
    "chif_pav_villa_prix_t3": decimal,
    "chif_pav_villa_prix_t4": decimal,
    "chif_pav_villa_prix_t5": decimal,
    "chif_pav_villa_prix_t6": decimal,
    "chif_pav_villa_prix_t7": decimal,
    "chif_pav_villa_prix_t8": decimal,
    "code_tva": integer,
    "referent_as_client": id referent,
    "com_as_sur_ca_client": decimal,
    "cell_dev_ref_responsable": decimal,
    "prix_autre": decimal,
    "taux_meuble": decimal,
}

#structure de donnees  pour le voir  tarif client
route="https://bo.amexpert.pro:4443/client/<int:id>/<str:typo>/tarifs"
method='GET'
params={
    id=id client
    typo="ext"
}

#structure de donnees pour supprimer tarif client
route="https://bo.amexpert.pro:4443/delete/<int:id>/<str:typo>/tarif"
method='DELETE'
params={
    id=id client
    typo="ext"
}
