import axios from 'axios';

const axiosClient = axios.create({
    baseURL: 'localhost:4000',
    headers: {
        apiKey: process.env.FIXER_API_KEY
    }
});

export default axiosClient;