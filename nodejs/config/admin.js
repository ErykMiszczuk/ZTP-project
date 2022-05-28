module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '9ea949a07755f912982f4cf1f1f9b76f'),
  },
});
