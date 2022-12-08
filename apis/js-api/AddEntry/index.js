module.exports = async function (context, req) {
    context.log(req.body);

    if (req.body) {
        // create timestamp
        var date = new Date();
        // setup new entry
        newRow = {
            TextEntry: req.body.newEntry,
            DisableView: false,
            DateCreated: date.toISOString(),
            DateModerated: null
        };
        context.bindings.newEntry = newRow;
        context.res = {
            body: newRow,
            mimetype: "application/json",
            status: 201
        };
    } else {
        context.res = {
            status: 400,
            body: "Please pass a valid entry in the request body"
        };
    }
}