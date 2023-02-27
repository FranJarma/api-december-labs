import { Request, Response } from "express";
import { getReportsByUser } from './../services/ReportService';
import { sendHttpStatus } from '../helpers/sendHttpStatus';

export const GetReportsByUser = async (req: Request, res: Response) => {
    try {
        const from: Date = req.body.from;
        const to: Date = req.body.to || null;
        const report = await getReportsByUser(from, to);
        sendHttpStatus(res, 200, report);
    } catch (error) {
        sendHttpStatus(res, 500);
    }

}