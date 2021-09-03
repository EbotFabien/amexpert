import sys
import datetime
import openpyxl
import xlrd,xlwt
from Database_project.project.data_base_ import db
from Database_project.project.data_base_.Models import Tarifs,Mission,Client,Expert,Client_History,prospect,prospect_History,Expert_History,Tarif_base
import pandas as pd

def regex1(data,Type):
    if  Type=='str':
        if type(data)==str:
            if data.isalnum() == False:
                a=str(data).split()
                vii=''.join(a)
                vii=vii.split("-")
                vii=''.join(vii)
                return vii.lower()
            if data == 'None':
                return ''
            if data == 'xxx':
                return ''
            if data == 'XXX':
                return ''
            else:
                return data.lower()
        else:
            return ''
    
    if  Type=='str1':
        if type(data)==str:
            if data == 'xxx':
                return ''
            if data == 'XXX':
                return ''
            if data == 'None':
                return ''
            else:
                return data.lower()
        else:
            return ''

    if  Type=='int':
        if type(data) == int:
            return int(data)
        if type(data) == str:
            a="".join(data.split())
            if a.isnumeric() == True:
                return int(a) 
            else:
                return False
        if data == None:
            return None 
        else:
            return False
        

        
            
            
            
    
    if  Type=='dec':
        try:
            return round(data,2)
        except:
            return None
            
    if  Type=='date':
        
        if isinstance(data,datetime.datetime) == True:
            return data
        elif isinstance(data,datetime.date) == True:
            return data
        elif data == None:
            a=1
        else:
            
            return False
            

def failed(av):
    ba=[]
    v=0
    for oo in av:
        tr=len(oo)
    for i in range(0,tr):
        ba.append(i)
    wb = xlwt.Workbook()
    style1 = xlwt.easyxf(num_format_str='D-MMM-YY')
    ws = wb.add_sheet('Anomalie')
    for oo in av:
            for q,i in zip(ba,oo) :
                if isinstance(i,datetime.datetime) == True:
                    ws.write(v, q, i,style1)
                elif isinstance(i,datetime.date) == True:
                    ws.write(v, q, i,style1) 
                else:
                    ws.write(v, q, i)
            v=v+1
    wb.save('C:/Users/user/Downloads/Telegram Desktop/Anomalieclient.xls')

def failed1(av):
    ba=[]
    v=0
    for oo in av:
        tr=len(oo)
    for i in range(0,tr):
        ba.append(i)
    wb = xlwt.Workbook()
    style1 = xlwt.easyxf(num_format_str='D-MMM-YY')
    ws = wb.add_sheet('Anomalie')
    for oo in av:
            for q,i in zip(ba,oo) :
                if isinstance(i,datetime.datetime) == True:
                    ws.write(v, q, i,style1)
                elif isinstance(i,datetime.date) == True:
                    ws.write(v, q, i,style1) 
                else:
                    ws.write(v, q, i)
            v=v+1
    wb.save('C:/Users/user/Downloads/Telegram Desktop/AnomaliePROSPECT.xls')


def date_(floa,date):
        try:
            v=datetime.datetime(*xlrd.xldate_as_tuple(floa,date))
            return v
        except:
            return floa

def lient(loc):
    anomalie=[]
    anomalie1=[]
    a=[]
    b=[]
    p=0
    wb_obj = openpyxl.load_workbook(loc,data_only=True)
    sheet=wb_obj.active
    for i in range(0,sheet.max_row):
        
        
            if sheet["J"][i].value!='PROSPECT':
                v=sheet["M"][i].value
                
                if type(v)==int: 
                    if v  not in a:
                        cli=Client.query.filter_by(reference=int(sheet["M"][i].value)).first()
                        a.append(v)
                        if cli is None:
                            create=Client()
                            
                            Histo=Client_History()
                            
                            create.reference=int(sheet["M"][i].value)
                            create.TYPE=regex1(sheet["P"][i].value,'str')
                            create.societe=regex1(sheet["Q"][i].value,'str')
                            create.enseigne=regex1(sheet["R"][i].value,'str')
                            create.titre=regex1(sheet["N"][i].value,'str')
                            create.nom=regex1(sheet["O"][i].value,'str1')
                            numero=regex1(sheet["AB"][i].value,'int')
                            if numero == False:
                                reason='Erreur de donnees ,erreur  de numero dans la colonne  avec valeur '+str(sheet["S"][i].value)
                                anomalie.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                                sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                                sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                                sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                                sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                                sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                                sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                                ,sheet["AB"][i].value,sheet["AC"][i].value,reason])
                                continue
                            else:
                                create.numero=numero
                            
                            siret=regex1(sheet["S"][i].value,'int')
                            if siret == False:
                                reason='Erreur de donnees ,erreur  de siret dans la colonne  avec valeur '+str(sheet["S"][i].value)
                                anomalie.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                                sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                                sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                                sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                                sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                                sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                                sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                                ,sheet["AB"][i].value,sheet["AC"][i].value,reason])
                                continue
                            else:
                                create.siret=siret
                            create.email=regex1(sheet["AC"][i].value,'str1')
                            date_creation=regex1(sheet["I"][i].value,'date')
                            if date_creation == False:
                                reason='Erreur de donnees ,erreur  de date dans la colonne  avec valeur '+str(sheet["W"][i].value)
                                anomalie.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                                sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                                sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                                sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                                sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                                sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                                sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                                ,sheet["AB"][i].value,sheet["AC"][i].value,reason])
                                continue
                            else:
                                create.date_creation=date_creation
                            
                            Histo.adresse1=regex1(sheet["U"][i].value,'str1')
                            Histo.adresse2=regex1(sheet["V"][i].value,'str1')
                            Histo.etat_client=regex1(sheet["J"][i].value,'str')
                            cp=regex1(sheet["W"][i].value,'int')
                            if cp == False:
                                reason='erreur  de date entree '
                                anomalie.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                                sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                                sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                                sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                                sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                                sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                                sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                                ,sheet["AB"][i].value,sheet["AC"][i].value,reason])
                                continue   
                            else:
                                Histo.cp=cp
                            Histo.ville=regex1(sheet["X"][i].value,'str1')
                            Histo.pays='France'
                            Histo.login_extranet=regex1(sheet["C"][i].value,'str1')
                            Histo.mpd_extranet=regex1(sheet["D"][i].value,'str1')
                            db.session.add(create)
                            db.session.add(Histo)
                            db.session.commit()
                            Histo.client_id=create.id
                            db.session.commit()
                        else:
                            print("Anomalie doublon")
                    else:
                        reason="Anomalie doublon sur la reference"
                        anomalie.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                        sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                        sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                        sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                        sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                        sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                        sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                        ,sheet["AB"][i].value,sheet["AC"][i].value,reason])
                else:
                    anomalie.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                    sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                    sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                    sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                    sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                    sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                    sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                    ,sheet["AB"][i].value,sheet["AC"][i].value,'reason'])
            if  sheet["J"][i].value =='PROSPECT':
                    v=sheet["L"][i].value 
                    if type(v)==int: 
                        if v  not in b:
                            cli=prospect.query.filter_by(reference=int(sheet["L"][i].value)).first()
                            b.append(v)
                            if cli is None:
                                create=prospect()
                                
                                Histo=prospect_History()
                                
                                create.reference=int(sheet["L"][i].value)
                                create.TYPE=regex1(sheet["P"][i].value,'str')
                                create.societe=regex1(sheet["Q"][i].value,'str')
                                create.enseigne=regex1(sheet["R"][i].value,'str')
                                create.titre=regex1(sheet["N"][i].value,'str')
                                create.nom=regex1(sheet["O"][i].value,'str1')
                                numero=regex1(sheet["AB"][i].value,'int')
                                if numero == False:
                                    reason='Erreur de donnees ,erreur  de numero dans la colonne  avec valeur '+str(sheet["S"][i].value)
                                    anomalie1.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                                    sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                                    sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                                    sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                                    sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                                    sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                                    sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                                    ,sheet["AB"][i].value,sheet["AC"][i].value,reason])
                                    continue
                                else:
                                    create.numero=numero
                                
                                siret=regex1(sheet["S"][i].value,'int')
                                if siret == False:
                                    reason='Erreur de donnees ,erreur  de siret dans la colonne  avec valeur '+str(sheet["S"][i].value)
                                    anomalie1.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                                    sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                                    sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                                    sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                                    sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                                    sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                                    sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                                    ,sheet["AB"][i].value,sheet["AC"][i].value,reason])
                                    continue
                                else:
                                    create.siret=siret
                                create.email=regex1(sheet["AC"][i].value,'str1')
                                date_creation=regex1(sheet["I"][i].value,'date')
                                if date_creation == False:
                                    reason='Erreur de donnees ,erreur  de date dans la colonne  avec valeur '+str(sheet["W"][i].value)
                                    anomalie1.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                                    sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                                    sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                                    sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                                    sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                                    sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                                    sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                                    ,sheet["AB"][i].value,sheet["AC"][i].value,reason])
                                    continue
                                else:
                                    create.date_creation=date_creation
                                
                                Histo.adresse1=regex1(sheet["U"][i].value,'str1')
                                Histo.adresse2=regex1(sheet["V"][i].value,'str1')
                                Histo.etat_client=regex1(sheet["J"][i].value,'str')
                                cp=regex1(sheet["W"][i].value,'int')
                                if cp == False:
                                    reason='Erreur de donnees ,erreur  de date dans la colonne  avec valeur '+str(sheet["W"][i].value)
                                    anomalie1.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                                    sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                                    sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                                    sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                                    sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                                    sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                                    sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                                    ,sheet["AB"][i].value,sheet["AC"][i].value,reason])
                                    continue   
                                else:
                                    Histo.cp=cp
                                Histo.ville=regex1(sheet["X"][i].value,'str1')
                                Histo.pays='France'
                                Histo.login_extranet=regex1(sheet["C"][i].value,'str1')
                                Histo.mpd_extranet=regex1(sheet["D"][i].value,'str1')
                                db.session.add(create)
                                db.session.add(Histo)
                                db.session.commit()
                                Histo.prospect=create.id
                                db.session.commit()
                            else:
                                print("Anomalie doublon")
                        else:
                            reason="Anomalie doublon sur la reference"
                            anomalie1.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                            sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                            sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                            sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                            sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                            sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                            sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                            ,sheet["AB"][i].value,sheet["AC"][i].value,reason])
                    else:
                        anomalie1.append([sheet["A"][i].value,sheet["B"][i].value,sheet["C"][i].value,
                        sheet["D"][i].value,sheet["E"][i].value,sheet["F"][i].value,sheet["G"][i].value,
                        sheet["H"][i].value,sheet["I"][i].value,sheet["J"][i].value,sheet["K"][i].value,
                        sheet["L"][i].value,sheet["M"][i].value,sheet["N"][i].value,sheet["O"][i].value,
                        sheet["P"][i].value,sheet["Q"][i].value,sheet["R"][i].value,sheet["S"][i].value,
                        sheet["T"][i].value,sheet["U"][i].value,sheet["V"][i].value,sheet["W"][i].value,
                        sheet["X"][i].value,sheet["Y"][i].value,sheet["Z"][i].value,sheet["AA"][i].value
                        ,sheet["AB"][i].value,sheet["AC"][i].value,'reason'])
    failed(anomalie)
    failed1(anomalie1)



