import { NextFunction, Request, Response } from 'express';
import { sendHttpStatus } from '../helpers/sendHttpStatus';

export const checkLoggedUser = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { userGuid } = req.body;
        const loggedUserGuid = 'c080d69c-2b27-44fb-b8ab-e7a4fa1514dc';
        if (userGuid === loggedUserGuid) {
            next();
        } else {
            sendHttpStatus(res, 401);
        }
    } catch (error) {
        sendHttpStatus(res, 500);
    }
}