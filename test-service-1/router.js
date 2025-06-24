const express = require('express');

const router = express.Router();

router.post('/api', (req, res) => {
    const date = new Date();
    res.json({ date: date.toISOString() });
});

module.exports = router;