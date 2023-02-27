import { Request, Response } from "express";
import { getReportsByUser } from './../services/ReportService';

export const GetReportsByUser = async (req: Request, res: Response) => {

    const from: Date = req.body.from;
    const to: Date = req.body.to || null;

    const report = await getReportsByUser(from, to);

    res.send(report);
}