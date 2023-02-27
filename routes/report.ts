import express, { Router } from 'express';
import { checkLoggedUser } from '../middlewares';
import { GetReportsByUser } from '../controllers/ReportController';

const router: Router = express.Router();

router.get('/transactions-report', [checkLoggedUser], GetReportsByUser);

module.exports = router;