HairCutLocationsHairCutLocations/*-----------------------------------------------------------------------------
Welcome to Appointotron3000!
-----------------------------------------------------------------------------*/
var restify = require('restify');
var builder = require('botbuilder');
var botbuilder_azure = require("botbuilder-azure");

// Setup Restify Server
var server = restify.createServer();
server.listen(process.env.port || process.env.PORT || 3978, function () {
    console.log('%s listening to %s', server.name, server.url);
});

// Create chat connector for communicating with the Bot Framework Service
var connector = new builder.ChatConnector({
    appId: process.env.MicrosoftAppId,
    appPassword: process.env.MicrosoftAppPassword,
    openIdMetadata: process.env.BotOpenIdMetadata
});

// Listen for messages from users 
server.post('/api/messages', connector.listen());

var tableName = 'botdata';
var azureTableClient = new botbuilder_azure.AzureTableClient(tableName, process.env['AzureWebJobsStorage']);
var tableStorage = new botbuilder_azure.AzureBotStorage({ gzipData: false }, azureTableClient);

// Create your bot with a function to receive messages from the user
// This default message handler is invoked if the user's utterance doesn't
// match any intents handled by other dialogs.
var bot = new builder.UniversalBot(connector, function (session, args) {
    session.send('You reached the default message handler. You said \'%s\'.', session.message.text);
});
bot.set('storage', tableStorage);

// Make sure you add code to validate these fields
var luisAppId = process.env.LuisAppId;
var luisAPIKey = process.env.LuisAPIKey;
var luisAPIHostName = process.env.LuisAPIHostName || 'westus.api.cognitive.microsoft.com';

const LuisModelUrl = 'https://' + luisAPIHostName + '/luis/v2.0/apps/' + luisAppId + '?subscription-key=' + luisAPIKey;

// Main dialog with LUIS
var recognizer = new builder.LuisRecognizer(LuisModelUrl);
bot.recognizer(recognizer);

bot.dialog('TurnOnDialog',
    (session, args) => {
        // Resolve and store any HomeAutomation.Device entity passed from LUIS.
        var intent = args.intent;
        var device = builder.EntityRecognizer.findEntity(intent.entities, '');

        // Turn on a specific device if a device entity is detected by LUIS
        if (device) {
            session.send('Ok, turning on the %s.', device.entity);
            // Put your code here for calling the IoT web service that turns on a device
        } else {
            // Assuming turning on lights is the default
            session.send('Ok, turning on the lights');
            // Put your code here for calling the IoT web service that turns on a device
        }
        session.endDialog();
    }
).triggerAction({
    matches: 'HomeAutomation.TurnOn'
})

bot.dialog('Greeting', session)[
    var intent = args.intent;
var device = builder.EntityRecognizer.findEntity(intent.entities, '');
session.send('Hi, I'm Appointotron, How may I help you? ');
]).triggerAction({
        matches: 'Greeting'
    });

bot.dialog('Goodbye', function (session, args) {
    session.send('Bye! Thanks for Chatting with Me! ');
}).triggerAction({
    matches: 'Goodbye'
});

bot.dialog('getInformation', function (session, args) {
    // ...
}).triggerAction({
    matches: 'ShowHotelsReviews'
});

bot.dialog('Help', function (session) {
    // ...
}).triggerAction({
    matches: 'Help'
});

bot.dialog('getInformation', [
    function (session, args, next) {
        session.send(" What information would you like? \'%s\'', session.message.text);

        // try extracting entities
        var priceEntity = builder.EntityRecognizer.findEntity(args.intent.entities, 'builtin.getInfo.Price');
        var ChildEntity = builder.EntityRecognizer.findEntity(args.intent.entities, 'builtin.getInfo.Childs');
        var MensEntity = builder.EntityRecognizer.findEntity(args.intent.entities, 'builtin.getInfo.Mens');
        var ChildEntity = builder.EntityRecognizer.findEntity(args.intent.entities, 'builtin.getInfo.Womens');
        var timingEntity = builder.EntityRecognizer.findEntity(args.intent.entities, 'builtin.getinformation.Timing');
        var TimeOpenEntity = builder.EntityRecognizer.findEntity(args.intent.entities, 'builtin.getinformation.TimeOpen');
        var TimeClosedEntity = builder.EntityRecognizer.findEntity(args.intent.entities, 'builtin.getinformation.TimeClosed');
        var HairCutLocationsEntity = builder.EntityRecognizer.findEntity(args.intent.entities, 'builtin.getinformation.HairCutLocations');
        if (priceEntity) {
            // price detected,continue
            if (ChildsEntity) {
                session.send('The Price for a child's hair cut is 10$ ');
                }
            if (MensEntity) {
                session.send('The Price for a mens's hair cut is 15$ ');
                }
            if (WomensEntity) {
                session.send('The Price for a child's hair cut is 20$ ');
                }
            next({ response: priceEntity.entity });
        } else if (timingEntity) {
            // timing entity detected, continue to next step
            session.dialogData.searchType = 'timing';
            session.send('%s is open from 7:00 AM to 5:00 PM');
            if (TimeOpenEntity) {
                session.send('%s opens at 6:30 AM - Bright and Early');
            }
            if (TimeClosedEntity) {
                session.send('%s Closes at 8:45 PM');
            }
            next({ response: timingEntity.entity });
        } else {
            // no entities detected, ask user 
            builder.Prompts.text(session, 'What info would you like?');
        }
        builder.Prompts.text(session, 'Can I help you with anything else?');
    },
    function (session, results) {
        var destination = results.response;

        var message = 'Looking for hotels';
        if (session.dialogData.searchType === 'airport') {
            message += ' near %s airport...';
        } else {
            message += ' in %s...';
        }

        session.send(message, destination);

        // Async search
        Store
            .searchHotels(destination)
            .then(function (hotels) {
                // args
                session.send('I found %d hotels:', hotels.length);

                var message = new builder.Message()
                    .attachmentLayout(builder.AttachmentLayout.carousel)
                    .attachments(hotels.map(hotelAsAttachment));

                session.send(message);

                // End
                session.endDialog();
            });
    }
]).triggerAction({
    matches: 'getInformation',
    onInterrupted: function (session) {
        session.send('What Would you like to Know about?');
    }
});

