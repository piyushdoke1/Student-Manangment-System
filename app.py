from bottle import *
from sqlite3 import *

def init_db():
    con = None
    try:
        con = connect("kc.db")
        sql = "create table if not exists student(rno int primary key, name text, marks int)"
        cursor = con.cursor()
        cursor.execute(sql)
        con.commit()
    except Exception as e:
        if con:
            con.rollback()
        print("issue", e)
    finally:
        if con:
            con.close()

init_db()

application = Bottle()

@application.route("/", method=["GET"])
def home():
    con = None
    try:
        con = connect("kc.db")
        sql = "select * from student"
        cursor = con.cursor()
        cursor.execute(sql)
        data = cursor.fetchall()
        return template("home", data=data)
    except Exception as e:
        return template("home", data=[])
    finally:
        if con:
            con.close()

@application.route("/create", method=["GET", "POST"])
def create():
    msg = ""
    if request.method == "POST":
        try:
            rno = int(request.forms.get("rno"))
            name = request.forms.get("name")
            marks = int(request.forms.get("marks"))
            con = connect("kc.db")
            sql = "insert into student values(?, ?, ?)"
            cursor = con.cursor()
            cursor.execute(sql, (rno, name, marks))
            con.commit()
            msg = "Record created"
        except Exception as e:
            if con:
                con.rollback()
            msg = "issue " + str(e)
        finally:
            if con:
                con.close()
    return template("create", msg=msg)

@application.route("/delete", method=["GET", "POST"])
def delete():
    msg = ""
    rno = request.query.get("rno", None)
    if rno:
        try:
            con = connect("kc.db")
            sql = "delete from student where rno = ?"
            cursor = con.cursor()
            cursor.execute(sql, (int(rno),))
            con.commit()
        except Exception as e:
            if con:
                con.rollback()
            msg = "issue " + str(e)
        finally:
            if con:
                con.close()
        redirect("/")
    return template("delete", msg=msg)

@application.route("/update", method=["GET", "POST"])
def update():
    msg = ""
    rno = request.query.get("rno", "")
    marks = ""

    if request.method == "POST":
        try:
            rno = int(request.forms.get("rno"))
            marks = int(request.forms.get("marks"))
            con = connect("kc.db")
            sql = "update student set marks = ? where rno = ?"
            cursor = con.cursor()
            cursor.execute(sql, (marks, rno))
            con.commit()
            redirect("/")
        except Exception as e:
            if con:
                con.rollback()
            msg = "issue " + str(e)
        finally:
            if con:
                con.close()
    else:
      
        try:
            con = connect("kc.db")
            cursor = con.cursor()
            cursor.execute("select marks from student where rno = ?", (rno,))
            row = cursor.fetchone()
            if row:
                marks = row[0]
        except:
            pass
        finally:
            if con:
                con.close()

    return template("update", msg=msg, rno=rno, marks=marks)


run(application, host="localhost", port=4050, debug=True)