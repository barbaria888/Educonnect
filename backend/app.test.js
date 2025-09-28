const request = require("supertest");
const app = require("../index");

describe("Backend Health Check", () => {
  it("should return 200 for /health", async () => {
    const res = await request(app).get("/health");
    expect(res.statusCode).toBe(200);
  });
});
