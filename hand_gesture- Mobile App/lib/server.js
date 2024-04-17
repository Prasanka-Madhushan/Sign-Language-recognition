const express = require('express');
const http = require('http');
const socketIo = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

io.on('connection', (socket) => {
    console.log('A user connected: ' + socket.id);

    // Handle signaling data from clients
    socket.on('signal', (data) => {
        console.log('Received signal: ', data);
        // Broadcast the signal to other clients
        socket.broadcast.emit('signal', data);
    });

    socket.on('disconnect', () => {
        console.log('User disconnected: ' + socket.id);
    });
});

const PORT = process.env.PORT || 5000;
server.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
