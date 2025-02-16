import pyodbc

def get_img(path):
    database = pyodbc.connect(
        "driver = {SQL Server};"
        "server = SARGASSOO/hp computers;"
        "database = localhost;"
        "trusted = yes;"
    )
    cursor = database.cursor()
    cursor.execute("SELECT photo FROM photos WHERE id=1")
    row = cursor.fetchone()
    
    with open(path, 'wb') as file:
        file.write(row[0])
    print('Image saved')
    
    cursor.close()
    database.close()

get_img('C:/Users/hp computers/Desktop/miracl tilla png.png')