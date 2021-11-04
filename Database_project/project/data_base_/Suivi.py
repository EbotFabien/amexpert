import sys
import datetime
import openpyxl
import xlrd,xlwt
from project.data_base_ import db
from project.data_base_.Models import suivi_prospect,suivi_client,Client,prospect
from project.data_base_.client_data  import regex1



def suiv(loc):
    a=[]
    b=[]
    p=0
    wb_obj = openpyxl.load_workbook(loc,data_only=True)
    sheet=wb_obj.active
    if sheet["W"][0].value!='CODE POSTAL'and sheet["AB"][0].value!='Tel principal client'and sheet["J"][0].value!='Ref code client- service comptabilité'and sheet["P"][0].value!='Fonction responsable':
                return False
    for i in range(0,sheet.max_row):
        
        
            if sheet["J"][i].value!='PROSPECT':
                v=sheet["M"][i].value
                
                if type(v)==int: 
                    if v  not in a:
                        cli=Client.query.filter_by(reference=int(sheet["M"][i].value)).first()
                        a.append(v)
                        if cli :
                            if str(sheet["B"][i].value) != '':
                                create=suivi_client(cli.id,0,sheet["B"][i].value)
                                db.session.add(create)
                                db.session.commit()

            if  sheet["J"][i].value =='PROSPECT':
                v=sheet["L"][i].value

                if type(v)==int: 
                    if v  not in b:
                        cli=prospect.query.filter_by(reference=int(sheet["L"][i].value)).first()
                        b.append(v)
                        if cli :
                            if str(sheet["B"][i].value) != '':
                                create=suivi_prospect(cli.id,0,sheet["B"][i].value)
                                db.session.add(create)
                                db.session.commit()
                