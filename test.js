app.post("/support-answer", (req, res) => {
    const compid = req.body.complaintID;
    const response = req.body.response;

    db.query('UPDATE complaint SET response = ? WHERE complaintID = ? ',[response, compid], (err, result) => {
        if(err){
            console.log(err)
        }
        else{
        res.render("support-answer")
        }
    })
})