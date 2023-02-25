import { NextFunction, Request, Response } from 'express';
import { getUsers } from '../services/UserServices';

export const checkLoggedUser = (accountGuid: String) => {

    return async (req: Request, res: Response, next: NextFunction) => {
        try {
            const users = await getUsers();
            const loggedUserGuid = users[Math.floor(Math.random() * users.length)].userGuid;
            if (accountGuid === loggedUserGuid) next();
            return res.status(401).send('Unauthorized');
        }
        catch (error) {
            return res.status(500).send('Internal server error');
        }
    }

}