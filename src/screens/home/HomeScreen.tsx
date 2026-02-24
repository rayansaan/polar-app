import React from 'react';
import {
  View,
  Text,
  ScrollView,
  StyleSheet,
  Dimensions,
  TouchableOpacity,
  FlatList,
  Image,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, spacing, typography, borderRadius } from '../../theme';
import { useAppStore } from '../../store';
import { DEMO_ANALYSES, DEMO_TRENDS, DEMO_CATEGORIES } from '../../data/demoMovies';

const { width } = Dimensions.get('window');

interface HomeScreenProps {
  navigation: any;
}

export const HomeScreen: React.FC<HomeScreenProps> = ({ navigation }) => {
  const { filteredMovies } = useAppStore();

  const renderHeader = () => (
    <View style={styles.header}>
      <Text style={styles.logo}>POLAR</Text>
      <TouchableOpacity 
        style={styles.profileIcon}
        onPress={() => navigation.navigate('Profile')}
      >
        <Text style={styles.profileText}>👤</Text>
      </TouchableOpacity>
    </View>
  );

  const renderHero = () => (
    <View style={styles.heroContainer}>
      <LinearGradient
        colors={['transparent', colors.background]}
        style={styles.heroGradient}
      >
        <View style={styles.heroContent}>
          <Text style={styles.heroLabel}>À LA UNE</Text>
          <Text style={styles.heroTitle}>Analyse : La tension géométrique dans Zodiac</Text>
          <Text style={styles.heroSubtitle}>Par David Fincher • 8 min de lecture</Text>
          <TouchableOpacity style={styles.heroButton}>
            <Text style={styles.heroButtonText}>Découvrir</Text>
          </TouchableOpacity>
        </View>
      </LinearGradient>
    </View>
  );

  const renderFeed = () => (
    <View style={styles.section}>
      <Text style={styles.sectionTitle}>DERNIÈRES ENQUÊTES</Text>
      <ScrollView horizontal showsHorizontalScrollIndicator={false}>
        {DEMO_ANALYSES.map((item) => (
          <TouchableOpacity key={item.id} style={styles.feedCard}>
            <View style={styles.feedImage}>
              <Text style={styles.feedEmoji}>🎬</Text>
            </View>
            <View style={styles.feedContent}>
              <View style={styles.feedTag}>
                <Text style={styles.feedTagText}>{item.category}</Text>
              </View>
              <Text style={styles.feedTitle}>{item.title}</Text>
              <Text style={styles.feedTime}>{item.readTime}</Text>
            </View>
          </TouchableOpacity>
        ))}
      </ScrollView>
    </View>
  );

  const renderTrends = () => (
    <View style={styles.section}>
      <Text style={styles.sectionTitle}>TENDANCES DU MOMENT</Text>
      <ScrollView horizontal showsHorizontalScrollIndicator={false}>
        {filteredMovies.slice(0, 10).map((movie) => (
          <TouchableOpacity 
            key={movie.id} 
            style={styles.trendCard}
            onPress={() => navigation.navigate('MovieDetail', { movieId: movie.id })}
          >
            <View style={styles.trendPoster}>
              <Text style={styles.trendEmoji}>🎥</Text>
            </View>
            <Text style={styles.trendTitle} numberOfLines={1}>{movie.title}</Text>
            <Text style={styles.trendRating}>★ {movie.polarRating}</Text>
          </TouchableOpacity>
        ))}
      </ScrollView>
    </View>
  );

  return (
    <SafeAreaView style={styles.container} edges={['top']}>
      <ScrollView showsVerticalScrollIndicator={false}>
        {renderHeader()}
        {renderHero()}
        {renderFeed()}
        {renderTrends()}
        <View style={styles.bottomPadding} />
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
  },
  logo: {
    ...typography.h2,
    color: colors.primary,
    letterSpacing: 4,
    fontWeight: '800',
  },
  profileIcon: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: colors.surface,
    justifyContent: 'center',
    alignItems: 'center',
  },
  profileText: {
    fontSize: 20,
  },
  heroContainer: {
    height: 300,
    backgroundColor: colors.surface,
    marginHorizontal: spacing.md,
    borderRadius: borderRadius.lg,
    overflow: 'hidden',
  },
  heroGradient: {
    flex: 1,
    justifyContent: 'flex-end',
    padding: spacing.md,
  },
  heroContent: {
    gap: spacing.sm,
  },
  heroLabel: {
    ...typography.caption,
    color: colors.primary,
    letterSpacing: 2,
  },
  heroTitle: {
    ...typography.h2,
    color: colors.text,
  },
  heroSubtitle: {
    ...typography.bodySmall,
    color: colors.textSecondary,
  },
  heroButton: {
    backgroundColor: colors.primary,
    paddingVertical: spacing.sm,
    paddingHorizontal: spacing.lg,
    borderRadius: borderRadius.md,
    alignSelf: 'flex-start',
    marginTop: spacing.sm,
  },
  heroButtonText: {
    ...typography.button,
    color: colors.text,
  },
  section: {
    marginTop: spacing.lg,
    paddingHorizontal: spacing.md,
  },
  sectionTitle: {
    ...typography.caption,
    color: colors.textSecondary,
    letterSpacing: 2,
    marginBottom: spacing.md,
  },
  feedCard: {
    width: 280,
    backgroundColor: colors.surface,
    borderRadius: borderRadius.lg,
    marginRight: spacing.md,
    overflow: 'hidden',
  },
  feedImage: {
    height: 120,
    backgroundColor: colors.surfaceLight,
    justifyContent: 'center',
    alignItems: 'center',
  },
  feedEmoji: {
    fontSize: 40,
  },
  feedContent: {
    padding: spacing.md,
  },
  feedTag: {
    backgroundColor: colors.primary,
    paddingHorizontal: spacing.sm,
    paddingVertical: 2,
    borderRadius: borderRadius.sm,
    alignSelf: 'flex-start',
    marginBottom: spacing.xs,
  },
  feedTagText: {
    ...typography.caption,
    color: colors.text,
  },
  feedTitle: {
    ...typography.body,
    fontWeight: '600',
    color: colors.text,
    marginBottom: spacing.xs,
  },
  feedTime: {
    ...typography.caption,
    color: colors.textMuted,
  },
  trendCard: {
    width: 120,
    marginRight: spacing.md,
  },
  trendPoster: {
    width: 120,
    height: 180,
    backgroundColor: colors.surface,
    borderRadius: borderRadius.md,
    justifyContent: 'center',
    alignItems: 'center',
  },
  trendEmoji: {
    fontSize: 40,
  },
  trendTitle: {
    ...typography.bodySmall,
    color: colors.text,
    marginTop: spacing.sm,
  },
  trendRating: {
    ...typography.caption,
    color: colors.gold,
  },
  bottomPadding: {
    height: 100,
  },
});

export default HomeScreen;
