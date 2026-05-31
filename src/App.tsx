import { Routes, Route, useLocation } from 'react-router-dom';
import { useOnboarding } from './hooks/useOnboarding';
import { OnboardingScreen } from './screens/OnboardingScreen';
import { FeedScreen } from './screens/FeedScreen';
import { SearchScreen } from './screens/SearchScreen';
import { MapScreen } from './screens/MapScreen';
import { ProfileScreen } from './screens/ProfileScreen';
import { MovieDetailScreen } from './screens/MovieDetailScreen';
import { NotFoundScreen } from './screens/NotFoundScreen';
import { BottomNav } from './components/ui/BottomNav';
import { Sidebar } from './components/ui/Sidebar';
import styles from './App.module.css';

export default function App() {
  const [hasSeenOnboarding, completeOnboarding] = useOnboarding();
  const location = useLocation();
  const isMovieDetail = location.pathname.startsWith('/movie/');

  return (
    <div className={styles.app}>
      {!hasSeenOnboarding ? (
        <OnboardingScreen onComplete={completeOnboarding} />
      ) : (
        <>
          <Sidebar />
          <div className={styles.content}>
            <Routes>
              <Route path="/" element={<FeedScreen />} />
              <Route path="/feed" element={<FeedScreen />} />
              <Route path="/search" element={<SearchScreen />} />
              <Route path="/map" element={<MapScreen />} />
              <Route path="/profile" element={<ProfileScreen />} />
              <Route path="/movie/:id" element={<MovieDetailScreen />} />
              <Route path="*" element={<NotFoundScreen />} />
            </Routes>
          </div>
          {!isMovieDetail && <BottomNav />}
        </>
      )}
    </div>
  );
}
