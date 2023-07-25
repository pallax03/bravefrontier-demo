const { MongoClient, ServerApiVersion } = require('mongodb');
const credentials = "C:/Users/alexm/ALL/Documents/Projects/X509-cert-5036652946076406822.pem"       //certificate
const client = new MongoClient('mongodb+srv://cluster0.at8jrut.mongodb.net/?authSource=%24external&authMechanism=MONGODB-X509&retryWrites=true&w=majority', {
  sslKey: credentials,
  sslCert: credentials,
  serverApi: ServerApiVersion.v1
});
let database;
let collection;

module.exports = {
  connect: async function() { //initialize connection to db
    await client.connect();
    database = client.db("bravefrontier");

    },
    connectToACollection: async function(collection) { //initialize connection to db
      try {
        collection = database.collection(collection);
      } catch (error) {
        console.log("collection doesn't exist");
      }
    },
    close: async function() { //close connection to db
      await client.close();
    },
    registerUser: async function(mail, psw, name) { //sign up a user
      try {
        const query = {
          "_id": mail,
          "password": psw,
          "display_name": name,
          "zel": { "$numberLong": "0" },
          "gems": { "$numberLong": "0" },
          "karma": { "$numberLong": "0" },
          "energy": { "$numberLong": "5" },
          "level": { "$numberInt": "0" },
          "arena_orbs": { "$numberDecimal": "0" }
        };
        const account = await collection.insertOne(query);
        return "";
      } catch (error) {
        console.log("!!! user already singed up!");
        return "mail already in use";
      }
    },
    getUser: async function(mail) { //sign up a user
      try {
        const query = { "_id": mail };
        const account = await collection.findOne(query);
        return JSON.stringify(account);
      } catch (error) {
        console.log("!!! user not exist!");
        return "user not exist";
      }
    }
};

// connectdb().catch(console.dir);