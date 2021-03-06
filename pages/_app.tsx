import '@styles/globals.scss';

import { AppProps } from 'next/app';
import React from 'react';

export default function App({ Component, pageProps }: AppProps): JSX.Element {
  return <Component {...pageProps} />;
}
