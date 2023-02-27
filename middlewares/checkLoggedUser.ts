import { NextFunction, Request, Response } from 'express';
import { getUsers } from '../services/UserService';
import { sendHttpStatus } from '../helpers/sendHttpStatus';

export const checkLoggedUser = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { userGuid } = req.body;
        const users = await getUsers() ?? [];
        const loggedUserGuid = users[Math.floor(Math.random() * users.length)].user_guid;
        if (userGuid === loggedUserGuid) {
            next();
        } else {
            sendHttpStatus(res, 401);
        }
    } catch (error) {
        sendHttpStatus(res, 500);
    }
}