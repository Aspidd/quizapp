const cds = require('@sap/cds');

module.exports = srv => {
    srv.on("Login", async req => {
        try {
            const {email, password} = req.data;
            const db = srv.transaction(req);
            const {User} = srv.entities;
            await db.read(User).where({email: email, password: password});
        }
        catch(e) {
            console.error(e);
            throw new Error("Login failed");
        }
    });
}