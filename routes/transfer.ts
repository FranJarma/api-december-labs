import express, { Router } from 'express';
import { checkLoggedUser } from '../middlewares';
import { CreateTransfer, GetTransfers } from '../controllers/TransferController';

const router: Router = express.Router();

router.post('/', [checkLoggedUser], CreateTransfer);
router.get('/', [checkLoggedUser], GetTransfers);

module.exports = router;