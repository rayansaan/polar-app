import React, { useState } from 'react';
import {
  View,
  Text,
  ScrollView,
  StyleSheet,
  TouchableOpacity,
  Dimensions,
  Modal,
  FlatList,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, spacing, typography, borderRadius } from '../../theme';
import { useAppStore } from '../../store';
import { useAuthStore } from '../../store/authStore';
import { NativeStackScreenProps } from '@react-navigation/native-stack';

const { width } = Dimensions.get('window');

type RootStackParamList = {
  Onboarding: undefined;
  Main: undefined;
  MovieDetail: { movieId: string };
};

type TabType = 'infos' | 'analyses' | 'casting';

type Props = NativeStackScreenProps<RootStackParamList, 'MovieDetail'>;

export const MovieDetailScreen = ({ navigation, route }: Props) => {
  const { movieId } = route.params;
  const { getMovieById } = useAppStore();
  const { favorites, addFavorite, removeFavorite, isAuthenticated } = useAuthStore();
  
  const [activeTab, setActiveTab] = useState<TabType>('infos');
  const [selectedScene, setSelectedScene] = useState<any>(null);
  const [selectedHotspot, setSelectedHotspot] = useState<any>(null);

  const movie = getMovieById(movieId);
  
  if (!movie) {
    return (
      <SafeAreaView style={styles.container}>
        <Text style={styles.errorText}>Film non trouvé</Text>
      </SafeAreaView>
    );
  }

  const isFavorite = favorites.some((f) => f.movie_id === movieId);

  const toggleFavorite = async () => {
    if (!isAuthenticated) {
      navigation.navigate('Auth' as any);
      return;
    }
    
    if (isFavorite) {
      await removeFavorite(movieId);
    } else {
      await addFavorite(movieId);
    }
  };

  const renderHeader = () => (
    <View style={styles.heroContainer}>
      <LinearGradient
        colors={['transparent', colors.background]}
        style={styles.heroGradient}
      >
        <TouchableOpacity 
          style={styles.backButton}
          onPress={() => navigation.goBack()}
        >
          <Text style={styles.backIcon}>←</Text>
        </TouchableOpacity>
        
        <View style={styles.heroContent}>
          <Text style={styles.heroTitle}>{movie.title}</Text>
          <Text style={styles.heroMeta}>
            {movie.year} • {movie.duration} min • {movie.genres.join(', ')}
          </Text>
          
          <View style={styles.heroActions}>
            <TouchableOpacity 
              style={[styles.favoriteButton, isFavorite && styles.favoriteButtonActive]}
              onPress={toggleFavorite}
            >
              <Text style={styles.favoriteIcon}>{isFavorite ? '❤️' : '🤍'}</Text>
              <Text style={styles.favoriteText}>
                {isFavorite ? 'Favori' : 'Ajouter aux favoris'}
              </Text>
            </TouchableOpacity>
          </View>
        </View>
      </LinearGradient>
    </View>
  );

  const renderTabs = () => (
    <View style={styles.tabsContainer}>
      {(['infos', 'analyses', 'casting'] as TabType[]).map((tab) => (
        <TouchableOpacity
          key={tab}
          style={[styles.tab, activeTab === tab && styles.tabActive]}
          onPress={() => setActiveTab(tab)}
        >
          <Text style={[styles.tabText, activeTab === tab && styles.tabTextActive]}>
            {tab === 'infos' ? 'Infos' : tab === 'analyses' ? 'Analyses' : 'Casting'}
          </Text>
        </TouchableOpacity>
      ))}
    </View>
  );

  const renderInfos = () => (
    <View style={styles.tabContent}>
      <View style={styles.ratingContainer}>
        <View style={styles.ratingItem}>
          <Text style={styles.ratingValue}>★ {movie.imdbRating}</Text>
          <Text style={styles.ratingLabel}>IMDb</Text>
        </View>
        <View style={styles.ratingItem}>
          <Text style={styles.ratingValuePolar}>★ {movie.polarRating}</Text>
          <Text style={styles.ratingLabel}>Polar</Text>
        </View>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Synopsis</Text>
        <Text style={styles.synopsis}>{movie.synopsis}</Text>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Réalisation</Text>
        <View style={styles.infoRow}>
          <Text style={styles.infoLabel}>Réalisateur</Text>
          <Text style={styles.infoValue}>{movie.director}</Text>
        </View>
        <View style={styles.infoRow}>
          <Text style={styles.infoLabel}>Scénaristes</Text>
          <Text style={styles.infoValue}>{movie.writers.join(', ')}</Text>
        </View>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Mots-clés</Text>
        <View style={styles.keywordsContainer}>
          {movie.keywords.map((keyword, index) => (
            <View key={index} style={styles.keyword}>
              <Text style={styles.keywordText}>{keyword}</Text>
            </View>
          ))}
        </View>
      </View>
    </View>
  );

  const renderAnalyses = () => (
    <View style={styles.tabContent}>
      <Text style={styles.analysesIntro}>
        Explorez les scènes clés et analysez les détails de mise en scène
      </Text>
      
      <Text style={styles.sectionTitle}>Timeline des Scènes</Text>
      <View style={styles.timeline}>
        {movie.scenes.map((scene, index) => (
          <TouchableOpacity
            key={scene.id}
            style={styles.timelineItem}
            onPress={() => setSelectedScene(scene)}
          >
            <View style={styles.timelineDot} />
            <View style={styles.timelineContent}>
              <Text style={styles.timelineTime}>{scene.timestamp} min</Text>
              <Text style={styles.timelineTitle}>{scene.title}</Text>
              <Text style={styles.timelineDesc} numberOfLines={2}>
                {scene.description}
              </Text>
              <View style={styles.hotspotCount}>
                <Text style={styles.hotspotCountText}>
                  🔍 {scene.hotspots.length} hotspot{scene.hotspots.length !== 1 ? 's' : ''}
                </Text>
              </View>
            </View>
          </TouchableOpacity>
        ))}
      </View>
    </View>
  );

  const renderCasting = () => (
    <View style={styles.tabContent}>
      <Text style={styles.sectionTitle}>Distribution</Text>
      {movie.cast.map((member, index) => (
        <View key={index} style={styles.castItem}>
          <View style={styles.castAvatar}>
            <Text style={styles.castEmoji}>👤</Text>
          </View>
          <View style={styles.castInfo}>
            <Text style={styles.castName}>{member.name}</Text>
            <Text style={styles.castCharacter}>{member.character}</Text>
          </View>
        </View>
      ))}
    </View>
  );

  const renderSceneModal = () => (
    <Modal
      visible={selectedScene !== null}
      animationType="slide"
      transparent={true}
      onRequestClose={() => setSelectedScene(null)}
    >
      <View style={styles.modalOverlay}>
        <View style={styles.modalContent}>
          <TouchableOpacity 
            style={styles.modalClose}
            onPress={() => setSelectedScene(null)}
          >
            <Text style={styles.modalCloseText}>✕</Text>
          </TouchableOpacity>
          
          {selectedScene && (
            <>
              <Text style={styles.modalTitle}>{selectedScene.title}</Text>
              <Text style={styles.modalTime}>Minute {selectedScene.timestamp}</Text>
              <Text style={styles.modalDesc}>{selectedScene.description}</Text>
              
              <Text style={styles.modalSectionTitle}>Points d'analyse</Text>
              {selectedScene.hotspots.map((hotspot: any) => (
                <TouchableOpacity
                  key={hotspot.id}
                  style={styles.hotspotItem}
                  onPress={() => setSelectedHotspot(hotspot)}
                >
                  <Text style={styles.hotspotTitle}>📍 {hotspot.title}</Text>
                </TouchableOpacity>
              ))}
            </>
          )}
        </View>
      </View>
    </Modal>
  );

  const renderHotspotModal = () => (
    <Modal
      visible={selectedHotspot !== null}
      animationType="fade"
      transparent={true}
      onRequestClose={() => setSelectedHotspot(null)}
    >
      <TouchableOpacity 
        style={styles.hotspotOverlay}
        activeOpacity={1}
        onPress={() => setSelectedHotspot(null)}
      >
        {selectedHotspot && (
          <View style={styles.hotspotCard}>
            <Text style={styles.hotspotCardTitle}>{selectedHotspot.title}</Text>
            <Text style={styles.hotspotCardAnnotation}>{selectedHotspot.annotation}</Text>
          </View>
        )}
      </TouchableOpacity>
    </Modal>
  );

  return (
    <SafeAreaView style={styles.container} edges={['top']}>
      <ScrollView showsVerticalScrollIndicator={false}>
        {renderHeader()}
        {renderTabs()}
        {activeTab === 'infos' && renderInfos()}
        {activeTab === 'analyses' && renderAnalyses()}
        {activeTab === 'casting' && renderCasting()}
        <View style={styles.bottomPadding} />
      </ScrollView>
      
      {renderSceneModal()}
      {renderHotspotModal()}
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  errorText: {
    ...typography.body,
    color: colors.textSecondary,
    textAlign: 'center',
    marginTop: 100,
  },
  heroContainer: {
    height: 350,
    backgroundColor: colors.surface,
  },
  heroGradient: {
    flex: 1,
    justifyContent: 'space-between',
  },
  backButton: {
    padding: spacing.md,
  },
  backIcon: {
    fontSize: 24,
    color: colors.text,
  },
  heroContent: {
    padding: spacing.md,
  },
  heroTitle: {
    ...typography.h1,
    color: colors.text,
    marginBottom: spacing.xs,
  },
  heroMeta: {
    ...typography.bodySmall,
    color: colors.textSecondary,
    marginBottom: spacing.md,
  },
  heroActions: {
    flexDirection: 'row',
  },
  favoriteButton: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.surface,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.round,
  },
  favoriteButtonActive: {
    backgroundColor: colors.primaryDark,
  },
  favoriteIcon: {
    fontSize: 18,
    marginRight: spacing.sm,
  },
  favoriteText: {
    ...typography.bodySmall,
    color: colors.text,
  },
  tabsContainer: {
    flexDirection: 'row',
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  tab: {
    flex: 1,
    paddingVertical: spacing.md,
    alignItems: 'center',
  },
  tabActive: {
    borderBottomWidth: 2,
    borderBottomColor: colors.primary,
  },
  tabText: {
    ...typography.body,
    color: colors.textSecondary,
  },
  tabTextActive: {
    color: colors.primary,
    fontWeight: '600',
  },
  tabContent: {
    padding: spacing.md,
  },
  ratingContainer: {
    flexDirection: 'row',
    justifyContent: 'center',
    gap: spacing.xl,
    marginBottom: spacing.lg,
  },
  ratingItem: {
    alignItems: 'center',
  },
  ratingValue: {
    ...typography.h2,
    color: colors.gold,
  },
  ratingValuePolar: {
    ...typography.h2,
    color: colors.primary,
  },
  ratingLabel: {
    ...typography.caption,
    color: colors.textSecondary,
  },
  section: {
    marginBottom: spacing.lg,
  },
  sectionTitle: {
    ...typography.caption,
    color: colors.textSecondary,
    letterSpacing: 2,
    marginBottom: spacing.md,
  },
  synopsis: {
    ...typography.body,
    color: colors.text,
    lineHeight: 24,
  },
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: spacing.sm,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  infoLabel: {
    ...typography.bodySmall,
    color: colors.textSecondary,
  },
  infoValue: {
    ...typography.bodySmall,
    color: colors.text,
  },
  keywordsContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.sm,
  },
  keyword: {
    backgroundColor: colors.surface,
    paddingHorizontal: spacing.sm,
    paddingVertical: spacing.xs,
    borderRadius: borderRadius.sm,
  },
  keywordText: {
    ...typography.caption,
    color: colors.textSecondary,
  },
  analysesIntro: {
    ...typography.body,
    color: colors.textSecondary,
    marginBottom: spacing.lg,
  },
  timeline: {
    gap: spacing.md,
  },
  timelineItem: {
    flexDirection: 'row',
    backgroundColor: colors.surface,
    borderRadius: borderRadius.lg,
    padding: spacing.md,
  },
  timelineDot: {
    width: 12,
    height: 12,
    borderRadius: 6,
    backgroundColor: colors.primary,
    marginRight: spacing.md,
    marginTop: 4,
  },
  timelineContent: {
    flex: 1,
  },
  timelineTime: {
    ...typography.caption,
    color: colors.primary,
  },
  timelineTitle: {
    ...typography.h3,
    color: colors.text,
    marginBottom: spacing.xs,
  },
  timelineDesc: {
    ...typography.bodySmall,
    color: colors.textSecondary,
    marginBottom: spacing.sm,
  },
  hotspotCount: {
    backgroundColor: colors.surfaceLight,
    paddingHorizontal: spacing.sm,
    paddingVertical: 2,
    borderRadius: borderRadius.sm,
    alignSelf: 'flex-start',
  },
  hotspotCountText: {
    ...typography.caption,
    color: colors.textSecondary,
  },
  castItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.surface,
    borderRadius: borderRadius.lg,
    padding: spacing.md,
    marginBottom: spacing.md,
  },
  castAvatar: {
    width: 50,
    height: 50,
    borderRadius: 25,
    backgroundColor: colors.surfaceLight,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: spacing.md,
  },
  castEmoji: {
    fontSize: 24,
  },
  castInfo: {
    flex: 1,
  },
  castName: {
    ...typography.body,
    color: colors.text,
    fontWeight: '600',
  },
  castCharacter: {
    ...typography.bodySmall,
    color: colors.textSecondary,
  },
  bottomPadding: {
    height: 100,
  },
  modalOverlay: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.9)',
    justifyContent: 'flex-end',
  },
  modalContent: {
    backgroundColor: colors.surface,
    borderTopLeftRadius: borderRadius.xl,
    borderTopRightRadius: borderRadius.xl,
    padding: spacing.lg,
    maxHeight: '80%',
  },
  modalClose: {
    position: 'absolute',
    top: spacing.md,
    right: spacing.md,
    zIndex: 1,
  },
  modalCloseText: {
    fontSize: 24,
    color: colors.textMuted,
  },
  modalTitle: {
    ...typography.h2,
    color: colors.text,
    marginBottom: spacing.xs,
  },
  modalTime: {
    ...typography.caption,
    color: colors.primary,
    marginBottom: spacing.md,
  },
  modalDesc: {
    ...typography.body,
    color: colors.textSecondary,
    marginBottom: spacing.lg,
  },
  modalSectionTitle: {
    ...typography.caption,
    color: colors.textSecondary,
    letterSpacing: 2,
    marginBottom: spacing.md,
  },
  hotspotItem: {
    backgroundColor: colors.surfaceLight,
    padding: spacing.md,
    borderRadius: borderRadius.md,
    marginBottom: spacing.sm,
  },
  hotspotTitle: {
    ...typography.body,
    color: colors.text,
  },
  hotspotOverlay: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.7)',
    justifyContent: 'center',
    alignItems: 'center',
    padding: spacing.lg,
  },
  hotspotCard: {
    backgroundColor: colors.surface,
    borderRadius: borderRadius.lg,
    padding: spacing.lg,
    width: '100%',
    maxWidth: 350,
  },
  hotspotCardTitle: {
    ...typography.h3,
    color: colors.text,
    marginBottom: spacing.md,
  },
  hotspotCardAnnotation: {
    ...typography.body,
    color: colors.textSecondary,
    lineHeight: 24,
  },
});

export default MovieDetailScreen;
