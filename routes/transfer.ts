import express, { Router } from 'express';
import { checkLoggedUser } from '../middlewares';
import { CreateTransfer } from '../controllers/TransferController';

const router: Router = express.Router();

router.post('/', [checkLoggedUser], CreateTransfer);

module.exports = router;