const express = require("express");
const app = express();

// Routes
app.get("/health", (req, res) => {
  res.status(200).send("OK");
});

// ✅ Export app first (for testing)
module.exports = app;

// ✅ Only start server if NOT in test mode
if (require.main === module) {
  const PORT = process.env.PORT || 5000;
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
}
