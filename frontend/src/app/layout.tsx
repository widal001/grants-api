import "src/styles/styles.scss";
import { GoogleAnalytics } from "@next/third-parties/google";
import { PUBLIC_ENV } from "../constants/environments";

import Layout from "src/components/AppLayout";
/**
 * Root layout component, wraps all pages.
 * @see https://nextjs.org/docs/app/api-reference/file-conventions/layout
 */
import { Metadata } from "next";

export const metadata: Metadata = {
  icons: [`${process.env.NEXT_PUBLIC_BASE_PATH ?? ""}/img/favicon.ico`],
};

interface LayoutProps {
  children: React.ReactNode;

  // TODO: use for i18n when ready
  //   params: {
  //     locale: string;
  //   };
}

export default function RootLayout({ children }: LayoutProps) {
  return (
    <html lang="en">
      <body>
        {/* Separate layout component for the inner-body UI elements since Storybook
            and tests trip over the fact that this file renders an <html> tag */}

        {/* TODO: Add locale="english" prop when ready for i18n */}
        <Layout>{children}</Layout>
      </body>
      {process.env.NEXT_PUBLIC_ENVIRONMENT === "prod" && (
        <GoogleAnalytics gaId={PUBLIC_ENV.GOOGLE_ANALYTICS_ID} />
      )}
    </html>
  );
}
