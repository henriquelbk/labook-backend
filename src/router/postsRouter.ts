import express from "express";
import { PostsController } from "../controller/PostController";
import { PostsBusiness } from "../business/PostBusiness";
import { IdGenerator } from "../services/IdGenerator";
import { TokenManager } from "../services/TokenManager";
import { PostsDatabase } from "../database/PostDatabase";

export const postsRouter = express.Router();

const postsController = new PostsController(
  new PostsBusiness(new PostsDatabase(), new IdGenerator(), new TokenManager())
);

postsRouter.post("/", postsController.createPost);
postsRouter.get("/", postsController.getPosts);
postsRouter.put("/:id", postsController.editPost);
postsRouter.delete("/:id", postsController.deletePost);
postsRouter.put("/:id/like", postsController.likeOrDislikePost);
