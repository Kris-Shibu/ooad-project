const express = require('express');
const mysql = require("mysql")
const dotenv = require('dotenv')
const app = express();
dotenv.config({ path: './.env'})
const db = mysql.createConnection({
    host: process.env.DATABASE_HOST,
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE
})
db.connect((error) => {
    if(error) {
        console.log(error)
    } else {
        console.log("MySQL connected!")
    }
})

app.set('view engine', 'hbs')

const path = require("path")

const publicDir = path.join(__dirname, './public')

app.use(express.static(publicDir))

app.get("/", (req, res) => {
    res.render("index")
})
app.get("/index", (req, res) => {
    res.render("index")
})
app.get("/register", (req, res) => {
    res.render("register")
})
app.get("/login-customer", (req, res) => {
    res.render("login-customer")
})
app.get("/login-support", (req, res) => {
    res.render("login-support")
})
app.get("/customer-landing", (req, res) => {
    res.render("customer-landing")
})

app.use(express.urlencoded({extended: 'false'}))
app.use(express.json())
const bcrypt = require("bcryptjs");
const { title } = require('process');

// FOR REGISTER PAGE
app.post("/register", (req, res) => {    
  //console.log(res)
  const email = req.body.emailid;
  db.query('SELECT email FROM customer WHERE email = ?', [email], async (error, result) => {
    if(error){
        console.log(error)
    }

    if( result.length > 0 ) {
        return res.render('register', {
            message: 'This email is already in use'
        })
    } 
    const pass = req.body.password;
    const firstName = req.body.fname;
    const lastName = req.body.lname;
    const userName = req.body.uname;
    let hashedPassword = await bcrypt.hash(pass, 8)

    console.log(hashedPassword)
   
    db.query('INSERT INTO customer SET?', {Fname: firstName, Lname: lastName,email: email,Uname: userName,password: pass}, (err, result) => {
        if(error) {
            console.log(error)
        } else {
            return res.render('register', {
                message: 'User registered!'
            })
        }
    })        
})

});

//FOR LOGIN PAGE
app.post("/login-customer", (req, res) => {
    const mailid = req.body.emailid;
    const pass = req.body.password;
    db.query('SELECT * FROM customer WHERE email = ? AND password = ?', [mailid, pass], (err, result) => {
        if (result.length === 1) {
            res.redirect('customer-complaint');
        }
        else{
                res.redirect("error")
            
        }
    })
})

app.get("/error", (req, res) => {
    res.render('error', { customer_reg: 'Please Use Registered Email ID or use correct password' });
})


  app.get("/customer-complaint", (req, res) => {
    res.render("customer-complaint")
})
//CUSTOMER VIEW
app.get("/customer-view", (req, res) => {
  
     db.query('SELECT * FROM complaint WHERE complaintAuthor = ?',[complaintAuthor], (err,result) => {

    if(result.length > 0)
    {
    res.render("customer-view", { data: result });
    }
    else{
        console.log()
    }
    })
});
  

var complaintAuthor = "example@gmail.com"
app.post("/customer-complaint", (req, res) => {    
    
    const complainttitle = req.body.title;
    const complaintDesc = req.body.desc;
     complaintAuthor = req.body.reg_email;
    console.log(complainttitle,complaintDesc,complaintAuthor)
      db.query('INSERT INTO complaint SET?', {complaintTitle: complainttitle, description: complaintDesc,complaintAuthor:complaintAuthor}, (err, result) => {
          if(err) {
              console.log(err)
          } else {
            console.log("done")
            return res.render('customer-complaint', {
                complaintreg: 'Complaint Registered'
            })
          }
      })        
  });

  //SUPPORT LOGIN

  app.post("/login-support", (req, res) => {
    const mailid = req.body.support_email;
    const pass = req.body.support_pass;

    db.query('SELECT * FROM support WHERE support_email = ? AND password = ?', [mailid, pass], (err, result) => {
        if (result.length === 1) {
            res.redirect("support-dashboard");
        }
        else{
            res.redirect("error")
        }
    })
})
   //SUPPORT DASHBOARD
   
   app.get("/support-dashboard", (req, res) => {
    console.log("in");
    db.query('SELECT COUNT(*) AS count FROM complaint WHERE complaintType = "unsolved"', (err, results) => {
      if (err) throw err;
      console.log(results);
      const unsolved = results[0].count;
      
      db.query('SELECT COUNT(*) AS count1 FROM complaint WHERE complaintType = "solved"', (err, results) => {
        if (err) throw err;
        // Extract the count from the results and pass it to the dashboard template
        const solved = results[0].count1;
        console.log(solved);
        res.render('support-dashboard', { unsolved, solved });
      });
    });
  });

//SUPPORT VIEW

app.get("/support-view", (req, res) => {
  
    db.query('SELECT * FROM complaint', (err,result) => {

   if(result.length > 0)
   {
   res.render("support-view", { data: result });
   }
   })
});


app.get("/support-answer", (req, res) => {
  
   res.render("support-answer");
   })

//SUPPORT ANSWER
   app.post("/support-answer", (req, res) => {
    const compid = req.body.complaintID;
    const response = req.body.response;

    db.query('UPDATE complaint SET response = ? WHERE complaintID = ? ',[response, compid], (err, result) => {
        if(err){
            console.log(err)
        }
        else{
            db.query('UPDATE complaint SET complaintType = ? WHERE complaintID = ? ',["solved",compid], (err, result) => {
                if(err){
                    console.log(err)
                }
                else{
        res.redirect("support-view")
        }
    })
}
    })
        })
   







    







app.listen(6969, ()=> {
    console.log("server started on port 6969")
})

