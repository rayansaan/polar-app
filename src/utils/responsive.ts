import { useState, useEffect } from 'react';
import { Dimensions } from 'react-native';

const DESKTOP_BREAKPOINT = 1280;

export function useBreakpoint() {
  const [dimensions, setDimensions] = useState(Dimensions.get('window'));

  useEffect(() => {
    const subscription = Dimensions.addEventListener('change', ({ window }) => {
      setDimensions(window);
    });

    return () => subscription.remove();
  }, []);

  const isDesktop = dimensions.width >= DESKTOP_BREAKPOINT;
  const isMobile = !isDesktop;

  return {
    width: dimensions.width,
    height: dimensions.height,
    isDesktop,
    isMobile,
  };
}
