import { Request, Response } from "express";
import { DateRange } from '../types/index';
import { getReportsByUser } from './../services/ReportService';

export const GetReportsByUser = async (req: Request, res: Response) => {

    const dateRange: DateRange = req.body.dateRange;

    const report = await getReportsByUser(dateRange);

    if (report) res.json(report);
}