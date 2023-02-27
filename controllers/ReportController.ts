import { Request, Response } from "express";
import { getReportsByUser } from './../services/ReportService';
import { sendHttpStatus } from '../helpers/sendHttpStatus';

export const GetReportsByUser = async (req: Request, res: Response) => {
    try {
        const from: string = req.body.from;
        const to: string = req.body.to || new Date().toISOString().slice(0, 19).replace('T', ' ');
        const report = await getReportsByUser(from, to);
        sendHttpStatus(res, 200, report);
    } catch (error) {
        sendHttpStatus(res, 500);
    }

}