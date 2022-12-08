module.exports = async function (context, req, recentEntries) {
    context.log(recentEntries);

    context.res = {
        status: 200,
        body: recentEntries,
        mimetype: "application/json"
    };
}