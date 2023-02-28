import { Request, Response } from 'express';
import { createTransfer, getTransfers } from '../services/TransferService';
import { sendHttpStatus } from '../helpers/sendHttpStatus';
import { transfer } from '@prisma/client';

export const CreateTransfer = async (req: Request, res: Response) => {
    try {
        const transfer = await createTransfer(req.body);
        sendHttpStatus(res, 200, transfer);
    } catch (error) {
        sendHttpStatus(res, 500);
    }
}

export const GetTransfers = async (req: Request, res: Response) => {
    try {
        const transfers: transfer[] = await getTransfers() || [];
        if (transfers.length > 0) {
            sendHttpStatus(res, 200, transfers);
        }
        else {
            sendHttpStatus(res, 204);
        }
    } catch (error) {
        sendHttpStatus(res, 500);
    }
}