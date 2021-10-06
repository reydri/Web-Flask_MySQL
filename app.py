from flask import Flask,render_template, request, url_for, redirect
from flask_mysqldb import MySQL


app = Flask(__name__, template_folder='template')


app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'wom_finance'
 
mysql = MySQL(app)

@app.route('/')
def home():
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM m_dukcapil_data')
    data = cur.fetchall()
    cur.close()
    return render_template('home.html', m_dukcapil_data=data)

@app.route('/simpan',methods=["POST"])
def simpan():
    nik = request.form['nik']
    nama = request.form['name1']
    panggilan = request.form['name2']
    tgl_lhr = request.form['tgl_lhr']
    gender = request.form['sex']
    agama = request.form['region']
    status = request.form['status']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO m_dukcapil_data VALUES (NULL,%s,%s,%s,%s,%s,%s,%s)",(nik,nama,panggilan,tgl_lhr,gender,agama,status))
    mysql.connection.commit()
    return redirect(url_for('home'))

@app.route('/update',methods=["POST"])
def update():
    id_data = request.form.get('id')
    nik = request.form['nik']
    nama = request.form['name1']
    panggilan = request.form['name2']
    tgl_lhr = request.form['tgl_lhr']
    cur = mysql.connection.cursor()
    cur.execute("UPDATE m_dukcapil_data SET NIK=%s, name=%s, maiden_name=%s, birth_date=%s WHERE m_dukcapil_data_id=%s",(nik, nama, panggilan, tgl_lhr, id_data))
    mysql.connection.commit()
    return redirect(url_for('home'))

@app.route('/hapus/<string:id_data>',methods=["GET"])
def hapus(id_data):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM m_dukcapil_data WHERE m_dukcapil_data_id=%s",(id_data,))
    mysql.connection.commit()
    return redirect(url_for('home'))

app.run(host='localhost', debug=True, port=5000)