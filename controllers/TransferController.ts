import { Request, Response } from 'express';
import { createTransfer } from '../services/TransferService';
import { sendHttpStatus } from '../helpers/sendHttpStatus';

export const CreateTransfer = async (req: Request, res: Response) => {
    try {
        const transfer = await createTransfer(req.body);
        sendHttpStatus(res, 200, transfer);
    } catch (error) {
        sendHttpStatus(res, 500);
    }
}