import React from 'react';
import {
  View,
  Text,
  ScrollView,
  StyleSheet,
  TouchableOpacity,
  Alert,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { colors, spacing, typography, borderRadius } from '../../theme';
import { useAppStore } from '../../store';
import { GENRES } from '../../data/demoMovies';

interface ProfileScreenProps {
  navigation: any;
}

export const ProfileScreen: React.FC<ProfileScreenProps> = ({ navigation }) => {
  const { setOnboardingComplete } = useAppStore();
  
  // Auth bypassed - using demo data
  const userData = {
    displayName: 'Explorateur Polar',
    email: 'demo@polar.app'
  };
  const profile = null;
  const favorites: any[] = [];
  const preferences = null;
  const watchlist: any[] = [];
  const ratings: any[] = [];

  const handleLogout = () => {
    Alert.alert(
      'Déconnexion',
      'Êtes-vous sûr de vouloir vous déconnecter ?',
      [
        { text: 'Annuler', style: 'cancel' },
        { 
          text: 'Se déconnecter', 
          style: 'destructive',
          onPress: async () => {
            setOnboardingComplete(false);
          }
        },
      ]
    );
  };

  const getGenreNames = (genreIndices: number[]) => {
    return genreIndices.map(i => GENRES[i] || '').filter(Boolean);
  };

  const favoriteMovies = favorites.map((f: any) => f.movie_id || f);

  return (
    <SafeAreaView style={styles.container} edges={['top']}>
      <ScrollView showsVerticalScrollIndicator={false}>
        <View style={styles.header}>
          <Text style={styles.title}>Mon Profil</Text>
        </View>

        <View style={styles.profileCard}>
          <View style={styles.avatarContainer}>
            <Text style={styles.avatarEmoji}>Avatar</Text>
          </View>
          <Text style={styles.profileName}>
            {profile?.display_name || userData?.displayName || 'Explorateur Polar'}
          </Text>
          <Text style={styles.profileEmail}>
            {userData?.email || 'Compte démo'}
          </Text>
        </View>

        <View style={styles.statsContainer}>
          <View style={styles.statItem}>
            <Text style={styles.statValue}>{favorites.length}</Text>
            <Text style={styles.statLabel}>Favoris</Text>
          </View>
          <View style={styles.statDivider} />
          <View style={styles.statItem}>
            <Text style={styles.statValue}>{watchlist.length}</Text>
            <Text style={styles.statLabel}>À voir</Text>
          </View>
          <View style={styles.statDivider} />
          <View style={styles.statItem}>
            <Text style={styles.statValue}>{ratings.length}</Text>
            <Text style={styles.statLabel}>Notés</Text>
          </View>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Mes Favoris</Text>
          {favoriteMovies.length === 0 ? (
            <Text style={styles.emptyText}>
              Ajoutez des films à vos favoris pour les retrouver ici
            </Text>
          ) : (
            <View style={styles.favoritesList}>
              {favoriteMovies.slice(0, 5).map((movieId) => (
                <TouchableOpacity
                  key={movieId}
                  style={styles.favoriteItem}
                  onPress={() => navigation.navigate('MovieDetail', { movieId })}
                >
                  <View style={styles.favoritePoster}>
                    <Text style={styles.favoriteEmoji}>Film</Text>
                  </View>
                  <Text style={styles.favoriteText}>Film #{movieId}</Text>
                </TouchableOpacity>
              ))}
            </View>
          )}
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Ma Watchlist</Text>
          {watchlist.length === 0 ? (
            <Text style={styles.emptyText}>
              Ajoutez des films à votre watchlist pour les retrouver ici
            </Text>
          ) : (
            <View style={styles.favoritesList}>
              {watchlist.slice(0, 5).map((item) => (
                <TouchableOpacity
                  key={item.id}
                  style={styles.favoriteItem}
                  onPress={() => navigation.navigate('MovieDetail', { movieId: item.movieId })}
                >
                  <View style={styles.favoritePoster}>
                    <Text style={styles.favoriteEmoji}>Liste</Text>
                  </View>
                  <View style={styles.favoriteInfo}>
                    <Text style={styles.favoriteText}>Film #{item.movieId}</Text>
                    <Text style={styles.favoriteStatus}>{item.status}</Text>
                  </View>
                </TouchableOpacity>
              ))}
            </View>
          )}
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Préférences</Text>
          <View style={styles.preferenceItem}>
            <Text style={styles.preferenceLabel}>Genres favoris</Text>
            <Text style={styles.preferenceValue}>
              {preferences?.favorite_genres && preferences.favorite_genres.length > 0 
                ? preferences.favorite_genres.join(', ') 
                : 'Non définis'}
            </Text>
          </View>
          <View style={styles.preferenceItem}>
            <Text style={styles.preferenceLabel}>Réalisateurs favoris</Text>
            <Text style={styles.preferenceValue}>
              {preferences?.favorite_directors && preferences.favorite_directors.length > 0 
                ? preferences.favorite_directors.join(', ') 
                : 'Non définis'}
            </Text>
          </View>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Compte</Text>
          <TouchableOpacity style={styles.menuItem}>
            <Text style={styles.menuIcon}>Profil</Text>
            <Text style={styles.menuText}>Modifier le profil</Text>
            <Text style={styles.menuArrow}>›</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.menuItem}>
            <Text style={styles.menuIcon}>Notif</Text>
            <Text style={styles.menuText}>Notifications</Text>
            <Text style={styles.menuArrow}>›</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.menuItem}>
            <Text style={styles.menuIcon}>Theme</Text>
            <Text style={styles.menuText}>Thème</Text>
            <Text style={styles.menuArrow}>›</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.menuItem}>
            <Text style={styles.menuIcon}>Aide</Text>
            <Text style={styles.menuText}>Aide</Text>
            <Text style={styles.menuArrow}>›</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.menuItem}>
            <Text style={styles.menuIcon}>Info</Text>
            <Text style={styles.menuText}>À propos</Text>
            <Text style={styles.menuArrow}>›</Text>
          </TouchableOpacity>
        </View>

        <TouchableOpacity style={styles.logoutButton} onPress={handleLogout}>
          <Text style={styles.logoutText}>Se déconnecter</Text>
        </TouchableOpacity>

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
    paddingHorizontal: spacing.md,
    paddingTop: spacing.md,
  },
  title: {
    ...typography.h1,
    color: colors.text,
  },
  profileCard: {
    alignItems: 'center',
    paddingVertical: spacing.xl,
  },
  avatarContainer: {
    width: 100,
    height: 100,
    borderRadius: 50,
    backgroundColor: colors.surface,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: spacing.md,
  },
  avatarEmoji: {
    fontSize: 50,
  },
  profileName: {
    ...typography.h2,
    color: colors.text,
    marginBottom: spacing.xs,
  },
  profileEmail: {
    ...typography.bodySmall,
    color: colors.textSecondary,
  },
  statsContainer: {
    flexDirection: 'row',
    backgroundColor: colors.surface,
    marginHorizontal: spacing.md,
    borderRadius: borderRadius.lg,
    padding: spacing.lg,
    marginBottom: spacing.lg,
  },
  statItem: {
    flex: 1,
    alignItems: 'center',
  },
  statValue: {
    ...typography.h2,
    color: colors.primary,
  },
  statLabel: {
    ...typography.caption,
    color: colors.textSecondary,
  },
  statDivider: {
    width: 1,
    backgroundColor: colors.border,
  },
  section: {
    paddingHorizontal: spacing.md,
    marginBottom: spacing.lg,
  },
  sectionTitle: {
    ...typography.caption,
    color: colors.textSecondary,
    letterSpacing: 2,
    marginBottom: spacing.md,
  },
  emptyText: {
    ...typography.body,
    color: colors.textMuted,
    textAlign: 'center',
    paddingVertical: spacing.lg,
  },
  favoritesList: {
    gap: spacing.sm,
  },
  favoriteItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.surface,
    borderRadius: borderRadius.md,
    padding: spacing.sm,
  },
  favoritePoster: {
    width: 40,
    height: 60,
    backgroundColor: colors.surfaceLight,
    borderRadius: borderRadius.sm,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: spacing.md,
  },
  favoriteEmoji: {
    fontSize: 20,
  },
  favoriteInfo: {
    flex: 1,
  },
  favoriteText: {
    ...typography.body,
    color: colors.text,
  },
  favoriteStatus: {
    ...typography.caption,
    color: colors.primary,
    marginTop: 2,
  },
  preferenceItem: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    backgroundColor: colors.surface,
    padding: spacing.md,
    borderRadius: borderRadius.md,
    marginBottom: spacing.sm,
  },
  preferenceLabel: {
    ...typography.body,
    color: colors.text,
  },
  preferenceValue: {
    ...typography.bodySmall,
    color: colors.textSecondary,
    maxWidth: '50%',
    textAlign: 'right',
  },
  menuItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.surface,
    padding: spacing.md,
    borderRadius: borderRadius.md,
    marginBottom: spacing.sm,
  },
  menuIcon: {
    fontSize: 20,
    marginRight: spacing.md,
  },
  menuText: {
    ...typography.body,
    color: colors.text,
    flex: 1,
  },
  menuArrow: {
    ...typography.h3,
    color: colors.textMuted,
  },
  logoutButton: {
    marginHorizontal: spacing.md,
    backgroundColor: colors.surface,
    padding: spacing.md,
    borderRadius: borderRadius.md,
    alignItems: 'center',
  },
  logoutText: {
    ...typography.button,
    color: colors.error,
  },
  bottomPadding: {
    height: 100,
  },
});

export default ProfileScreen;
