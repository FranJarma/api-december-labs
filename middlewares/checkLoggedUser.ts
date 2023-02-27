import { NextFunction, Request, Response } from 'express';
import { getUsers } from '../services/UserService';

export const checkLoggedUser = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { userGuid } = req.body;
        const users = await getUsers();
        const loggedUserGuid = users[Math.floor(Math.random() * users.length)].user_guid;
        if (userGuid === loggedUserGuid) {
            next();
        } else {
            return res.status(401).send('Unauthorized');
        }
    } catch (error) {
        return res.status(500).send('Internal server error');
    }
}