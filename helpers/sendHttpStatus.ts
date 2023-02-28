import { Response } from 'express';

export const sendHttpStatus = (res: Response, code: number, data?: any) => {
    if (code === 500) {
        return res.status(code).send({
            msg: 'Internal server error',
            code: code
        });
    }
    if (code === 401) {
        return res.status(code).send({
            msg: 'Unauthorized',
            code: code
        });
    }
    if (code === 200) {
        return res.status(code).send({
            msg: 'Ok',
            code: code,
            data: data
        });
    }
    if (code === 204) {
        return res.status(code).send({
            msg: 'No content',
            code: code
        });
    }
}