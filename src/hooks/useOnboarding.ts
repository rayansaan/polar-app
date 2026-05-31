import { useLocalStorage } from './useLocalStorage';

export function useOnboarding(): [boolean, () => void] {
  const [hasSeen, setHasSeen] = useLocalStorage('polar_onboarding_seen', false);

  const complete = () => {
    setHasSeen(true);
  };

  return [hasSeen, complete];
}
