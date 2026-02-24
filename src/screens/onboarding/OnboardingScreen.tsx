import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Dimensions,
  ScrollView,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, spacing, typography, borderRadius } from '../../theme';
import { useAppStore } from '../../store';
import { GENRES, DEMO_DIRECTORS } from '../../data/demoMovies';
import { Genre } from '../../types';

const { width, height } = Dimensions.get('window');

interface OnboardingScreenProps {
  navigation: any;
}

export const OnboardingScreen: React.FC<OnboardingScreenProps> = ({ navigation }) => {
  const [currentStep, setCurrentStep] = useState(0);
  const [selectedGenres, setSelectedGenres] = useState<Genre[]>([]);
  const [selectedDirectors, setSelectedDirectors] = useState<string[]>([]);
  const [tutorialCompleted, setTutorialCompleted] = useState(false);
  const { setOnboardingComplete, updatePreferences } = useAppStore();

  const toggleGenre = (genre: Genre) => {
    if (selectedGenres.includes(genre)) {
      setSelectedGenres(selectedGenres.filter((g) => g !== genre));
    } else {
      setSelectedGenres([...selectedGenres, genre]);
    }
  };

  const toggleDirector = (director: string) => {
    if (selectedDirectors.includes(director)) {
      setSelectedDirectors(selectedDirectors.filter((d) => d !== director));
    } else {
      setSelectedDirectors([...selectedDirectors, director]);
    }
  };

  const handleComplete = () => {
    updatePreferences({
      favoriteGenres: selectedGenres,
      favoriteDirectors: selectedDirectors,
    });
    setOnboardingComplete(true);
  };

  const renderStep1 = () => (
    <View style={styles.stepContainer}>
      <View style={styles.videoPlaceholder}>
        <Text style={styles.videoEmoji}>🎬</Text>
        <Text style={styles.videoText}>Vidéo背景</Text>
      </View>
      
      <View style={styles.contentContainer}>
        <Text style={styles.title}>Discover more About your favorite movies</Text>
        <Text style={styles.subtitle}>
          Explorez les secrets de fabrication de vos thrillers préférés
        </Text>
        
        <TouchableOpacity 
          style={styles.ctaButton}
          onPress={() => setCurrentStep(1)}
        >
          <Text style={styles.ctaText}>Commencer l'enquête</Text>
        </TouchableOpacity>
      </View>
    </View>
  );

  const renderStep2 = () => (
    <View style={styles.stepContainer}>
      <Text style={styles.title}>Quels sont vos suspects habituels ?</Text>
      <Text style={styles.subtitle}>
        Personnalisez votre expérience en sélectionnant vos préférences
      </Text>

      <ScrollView style={styles.selectionContainer} showsVerticalScrollIndicator={false}>
        <Text style={styles.selectionTitle}>Sous-genres</Text>
        <View style={styles.chipsContainer}>
          {GENRES.slice(0, 8).map((genre) => (
            <TouchableOpacity
              key={genre}
              style={[
                styles.chip,
                selectedGenres.includes(genre) && styles.chipActive,
              ]}
              onPress={() => toggleGenre(genre)}
            >
              <Text style={[
                styles.chipText,
                selectedGenres.includes(genre) && styles.chipTextActive,
              ]}>
                {genre}
              </Text>
            </TouchableOpacity>
          ))}
        </View>

        <Text style={[styles.selectionTitle, { marginTop: spacing.lg }]}>
          Réalisateurs favoris
        </Text>
        <View style={styles.chipsContainer}>
          {DEMO_DIRECTORS.slice(0, 10).map((director) => (
            <TouchableOpacity
              key={director}
              style={[
                styles.chip,
                selectedDirectors.includes(director) && styles.chipActive,
              ]}
              onPress={() => toggleDirector(director)}
            >
              <Text style={[
                styles.chipText,
                selectedDirectors.includes(director) && styles.chipTextActive,
              ]}>
                {director}
              </Text>
            </TouchableOpacity>
          ))}
        </View>
      </ScrollView>

      <TouchableOpacity 
        style={styles.ctaButton}
        onPress={() => setCurrentStep(2)}
      >
        <Text style={styles.ctaText}>Continuer</Text>
      </TouchableOpacity>
    </View>
  );

  const renderStep3 = () => (
    <View style={styles.stepContainer}>
      <Text style={styles.title}>Apprenez à analyser</Text>
      <Text style={styles.subtitle}>
        Touchez les points d'intérêt pour découvrir les analyses
      </Text>

      <View style={styles.tutorialContainer}>
        <View style={styles.tutorialImage}>
          <Text style={styles.tutorialEmoji}>🎥</Text>
          
          {!tutorialCompleted ? (
            <TouchableOpacity
              style={styles.hotspotTutorial}
              onPress={() => setTutorialCompleted(true)}
            >
              <View style={styles.hotspotOuter}>
                <View style={styles.hotspotInner} />
              </View>
              <Text style={styles.hotspotLabel}>Toucher l'indice</Text>
            </TouchableOpacity>
          ) : (
            <View style={styles.tutorialSuccess}>
              <Text style={styles.successEmoji}>✓</Text>
              <Text style={styles.successText}>
                Analyse : Le jeu de lumière sur le personnage révèle sa tension intérieure
              </Text>
            </View>
          )}
        </View>
      </View>

      <TouchableOpacity 
        style={[styles.ctaButton, !tutorialCompleted && styles.ctaButtonDisabled]}
        onPress={handleComplete}
        disabled={!tutorialCompleted}
      >
        <Text style={styles.ctaText}>Créer mon profil</Text>
      </TouchableOpacity>
    </View>
  );

  return (
    <SafeAreaView style={styles.container} edges={['top', 'bottom']}>
      <LinearGradient
        colors={[colors.background, colors.surface]}
        style={styles.gradient}
      >
        <View style={styles.progressContainer}>
          {[0, 1, 2].map((step) => (
            <View 
              key={step} 
              style={[
                styles.progressDot,
                step === currentStep && styles.progressDotActive,
                step < currentStep && styles.progressDotComplete,
              ]} 
            />
          ))}
        </View>

        {currentStep === 0 && renderStep1()}
        {currentStep === 1 && renderStep2()}
        {currentStep === 2 && renderStep3()}
      </LinearGradient>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  gradient: {
    flex: 1,
  },
  progressContainer: {
    flexDirection: 'row',
    justifyContent: 'center',
    paddingTop: spacing.lg,
    gap: spacing.sm,
  },
  progressDot: {
    width: 8,
    height: 8,
    borderRadius: 4,
    backgroundColor: colors.surfaceLight,
  },
  progressDotActive: {
    backgroundColor: colors.primary,
    width: 24,
  },
  progressDotComplete: {
    backgroundColor: colors.primary,
  },
  stepContainer: {
    flex: 1,
    padding: spacing.md,
  },
  videoPlaceholder: {
    height: height * 0.4,
    backgroundColor: colors.surface,
    borderRadius: borderRadius.xl,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: spacing.lg,
  },
  videoEmoji: {
    fontSize: 80,
  },
  videoText: {
    ...typography.caption,
    color: colors.textMuted,
    marginTop: spacing.md,
  },
  contentContainer: {
    flex: 1,
    justifyContent: 'center',
  },
  title: {
    ...typography.h1,
    color: colors.text,
    textAlign: 'center',
    marginBottom: spacing.md,
  },
  subtitle: {
    ...typography.body,
    color: colors.textSecondary,
    textAlign: 'center',
    marginBottom: spacing.xl,
  },
  ctaButton: {
    backgroundColor: colors.primary,
    paddingVertical: spacing.md,
    borderRadius: borderRadius.lg,
    alignItems: 'center',
  },
  ctaButtonDisabled: {
    backgroundColor: colors.surfaceLight,
  },
  ctaText: {
    ...typography.button,
    color: colors.text,
  },
  selectionContainer: {
    flex: 1,
    marginVertical: spacing.lg,
  },
  selectionTitle: {
    ...typography.caption,
    color: colors.textSecondary,
    letterSpacing: 2,
    marginBottom: spacing.md,
  },
  chipsContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.sm,
  },
  chip: {
    backgroundColor: colors.surface,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.round,
    borderWidth: 1,
    borderColor: colors.border,
  },
  chipActive: {
    backgroundColor: colors.primary,
    borderColor: colors.primary,
  },
  chipText: {
    ...typography.bodySmall,
    color: colors.textSecondary,
  },
  chipTextActive: {
    color: colors.text,
  },
  tutorialContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  tutorialImage: {
    width: width - 64,
    height: 300,
    backgroundColor: colors.surface,
    borderRadius: borderRadius.xl,
    justifyContent: 'center',
    alignItems: 'center',
    position: 'relative',
  },
  tutorialEmoji: {
    fontSize: 80,
  },
  hotspotTutorial: {
    position: 'absolute',
    bottom: 60,
    alignItems: 'center',
  },
  hotspotOuter: {
    width: 50,
    height: 50,
    borderRadius: 25,
    borderWidth: 2,
    borderColor: colors.primary,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'rgba(229, 9, 20, 0.3)',
  },
  hotspotInner: {
    width: 20,
    height: 20,
    borderRadius: 10,
    backgroundColor: colors.primary,
  },
  hotspotLabel: {
    ...typography.caption,
    color: colors.primary,
    marginTop: spacing.sm,
  },
  tutorialSuccess: {
    position: 'absolute',
    bottom: 20,
    backgroundColor: colors.surfaceLight,
    padding: spacing.md,
    borderRadius: borderRadius.md,
    maxWidth: width - 96,
  },
  successEmoji: {
    fontSize: 20,
    color: colors.success,
    marginBottom: spacing.xs,
  },
  successText: {
    ...typography.bodySmall,
    color: colors.text,
  },
});

export default OnboardingScreen;
