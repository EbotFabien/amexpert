from Database_project.project.data_base_ import create_app
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address
from Database_project.project.data_base_ import bcrypt,db

app= create_app()
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
#limiter = Limiter(
 #  app,
  # key_func=get_remote_address,
  # default_limits=["20 per minute", "1 per second"],
#)



    









#db.drop_all()
#db.create_all()



    
            
    

        
if __name__ == '__main__':
    app.run(debug=True)


