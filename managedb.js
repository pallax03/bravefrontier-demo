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

    try {
      await client.connect();
      database = client.db("bravefrontier");
      return 0;
    } catch (error) {
      console.log("connection to db failed");
      return 1;
    }
    },
    connectToACollection: async function(collection_name) { //initialize connection to db
      try {
        collection = database.collection(collection_name);
        return 0;
      } catch (error) {
        console.log("collection doesn't exist");
        return 1;
      }
    },
    close: async function() { //close connection to db
      await client.close();
    },
    registerUser: async function(mail, psw, name) { //sign up an user
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
    getUser: async function(mail) { //retrieve info about an user
      try {
        const query = { "_id": mail };
        const account = await collection.findOne(query);
        var json = JSON.stringify(account, function (key, value) {
          if (Object.keys(value)[0].startsWith('$') ) {
            return Object.values(value)[0];
          } else {
            return value;
          }
        });
        console.log('Requested user: '+ mail +'\n'+json);
        return json;
      } catch (error) {
        console.log("!!! user " + mail + " not exist!");
        return "user not exist";
      }
    },
    addUnits: async function(mail) { //add units or unit

    },
    getUnit: async function(unit_id) { //retrieve info about a user
      try {
        const query = { "_id": unit_id };
        const unit = await collection.findOne(query);
        var json = JSON.stringify(unit, function (key, value) {
          if (Object.keys(value)[0].startsWith('$') ) {
            return Object.values(value)[0];
          } else {
            return value;
          }
        });
        console.log('Requested unit: '+ unit_id +'\n'+json);
        return json;
      } catch (error) {
        error = "unit " + unit_id + " not exist!";
        console.log(error);
        return error;
      }
    }
};