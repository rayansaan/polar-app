import React, { useEffect, useState } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { View, Text, StyleSheet } from 'react-native';
import { colors } from '../theme';
import { useAppStore } from '../store';
import { useBreakpoint } from '../utils/responsive';
import { Sidebar } from '../components/Sidebar';

import { HomeScreen } from '../screens/home';
import { SearchScreen } from '../screens/search';
import { MapScreen } from '../screens/map';
import { ProfileScreen } from '../screens/profile';
import { MovieDetailScreen } from '../screens/movie';
import { OnboardingScreen } from '../screens/onboarding';

const Stack = createNativeStackNavigator();
const Tab = createBottomTabNavigator();

const TabIcon = ({ icon, focused }: { icon: string; focused: boolean }) => (
  <View style={styles.tabIconContainer}>
    <Text style={[styles.tabIcon, focused && styles.tabIconFocused]}>{icon}</Text>
  </View>
);

const MainTabs = () => {
  return (
    <Tab.Navigator
      screenOptions={{
        headerShown: false,
        tabBarStyle: styles.tabBar,
        tabBarActiveTintColor: colors.primary,
        tabBarInactiveTintColor: colors.textMuted,
        tabBarLabelStyle: styles.tabLabel,
      }}
    >
      <Tab.Screen
        name="Home"
        component={HomeScreen}
        options={{
          tabBarLabel: 'Actualité',
          tabBarIcon: ({ focused }) => <TabIcon icon="Actu" focused={focused} />,
        }}
      />
      <Tab.Screen
        name="Search"
        component={SearchScreen}
        options={{
          tabBarLabel: 'Recherche',
          tabBarIcon: ({ focused }) => <TabIcon icon="Rech." focused={focused} />,
        }}
      />
      <Tab.Screen
        name="Map"
        component={MapScreen}
        options={{
          tabBarLabel: 'Carte',
          tabBarIcon: ({ focused }) => <TabIcon icon="Carte" focused={focused} />,
        }}
      />
      <Tab.Screen
        name="Profile"
        component={ProfileScreen}
        options={{
          tabBarLabel: 'Profil',
          tabBarIcon: ({ focused }) => <TabIcon icon="Profil" focused={focused} />,
        }}
      />
    </Tab.Navigator>
  );
};

const DesktopLayout = () => {
  const [activeScreen, setActiveScreen] = useState('Home');

  const renderScreen = () => {
    switch (activeScreen) {
      case 'Home':
        return <HomeScreen navigation={{ navigate: () => {} }} />;
      case 'Search':
        return <SearchScreen navigation={{ navigate: () => {} }} />;
      case 'Map':
        return <MapScreen navigation={{ navigate: () => {} }} />;
      case 'Profile':
        return <ProfileScreen navigation={{ navigate: () => {} }} />;
      default:
        return <HomeScreen navigation={{ navigate: () => {} }} />;
    }
  };

  return (
    <View style={styles.desktopContainer}>
      <Sidebar activeRoute={activeScreen} onNavigate={setActiveScreen} />
      <View style={styles.desktopContent}>
        {renderScreen()}
      </View>
    </View>
  );
};

export const AppNavigator = () => {
  const { isOnboardingComplete, isLoading: appLoading } = useAppStore();
  const { isDesktop } = useBreakpoint();

  useEffect(() => {
    // Auth bypassed - no initialization needed
  }, []);

  if (appLoading) {
    return (
      <View style={styles.loadingContainer}>
        <Text style={styles.loadingText}>POLAR</Text>
      </View>
    );
  }

  return (
    <NavigationContainer>
      <Stack.Navigator
        screenOptions={{
          headerShown: false,
          contentStyle: { backgroundColor: colors.background },
        }}
      >
        {!isOnboardingComplete ? (
          <Stack.Screen name="Onboarding" component={OnboardingScreen} />
        ) : isDesktop ? (
          <Stack.Screen name="Main" component={DesktopLayout} />
        ) : (
          <>
            <Stack.Screen name="Main" component={MainTabs} />
            <Stack.Screen 
              name="MovieDetail" 
              component={MovieDetailScreen as any}
              options={{
                animation: 'slide_from_right',
              }}
            />
          </>
        )}
      </Stack.Navigator>
    </NavigationContainer>
  );
};

const styles = StyleSheet.create({
  loadingContainer: {
    flex: 1,
    backgroundColor: colors.background,
    justifyContent: 'center',
    alignItems: 'center',
  },
  loadingText: {
    fontSize: 40,
    color: colors.primary,
    fontWeight: '800',
    letterSpacing: 8,
  },
  tabBar: {
    backgroundColor: colors.surface,
    borderTopColor: colors.border,
    borderTopWidth: 1,
    height: 80,
    paddingBottom: 20,
    paddingTop: 10,
  },
  tabLabel: {
    fontSize: 10,
    fontWeight: '600',
  },
  tabIconContainer: {
    alignItems: 'center',
    justifyContent: 'center',
  },
  tabIcon: {
    fontSize: 12,
    opacity: 0.6,
  },
  tabIconFocused: {
    opacity: 1,
  },
  desktopContainer: {
    flex: 1,
    flexDirection: 'row',
  },
  desktopContent: {
    flex: 1,
  },
});

export default AppNavigator;
