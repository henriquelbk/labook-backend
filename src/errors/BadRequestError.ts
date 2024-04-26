import { BaseError } from "./BaseError";

export class BadRequestError extends BaseError {
    constructor(
        message: string = "Requisição inválida" // erro padrão caso não seja enviado um argumento
    ) {
        super(400, message)
    }
}