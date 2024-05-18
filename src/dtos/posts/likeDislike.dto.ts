import z from 'zod'

export interface LikeDislikeInputDTO {
  token: string;
  like: boolean;
  postId: string;
}

export type LikeDislikeOutputDTO = undefined;

export const LikeOrDislikeSchema = z
  .object({
    token: z.string(),
    like: z.boolean(),
    postId: z.string().min(1),
  })
  .transform((data) => data as LikeDislikeInputDTO);
