import NextAuth from 'next-auth';
import KeycloakProvider from 'next-auth/providers/keycloak';
import { KEYCLOAK_ID, KEYCLOAK_ISSUER, KEYCLOAK_SECRET } from '@/config/globals';

const authOptions = {
  providers: [
    KeycloakProvider({
      clientId: KEYCLOAK_ID,
      clientSecret: KEYCLOAK_SECRET,
      issuer: KEYCLOAK_ISSUER,
    }),
  ],
};

export const {
  handlers: { GET, POST },
  auth,
} = NextAuth(authOptions);
